// 商品表单
$(function(){
  if (!document.querySelector('body.products form.product')) {
    return;
  }

  // 分类选择
  (function(){
    var container = $('.category-selector');

    // 禁止修改分类
    if (container.attr('data-disabled')) {
      container.find('select').prop('disabled', true);
      return;
    }

    var input = container.find('input')[0];
    container.find('select').prop('disabled', false);

    // 转为 id => [{id: 1, name: ''}]，便于使用
    var idToChildren = {};
    var setChildren = function(categories){
      var i$, len$, category;
      for (i$ = 0, len$ = categories.length; i$ < len$; ++i$) {
        category = categories[i$];
        if (category.children && category.children.length) {
          idToChildren[category.id] = category.children;
          setChildren(category.children);
        }
      }
    };

    // 初始化
    var initializeSelector = function(categories){
      setChildren(categories);

      // 重置，避免页面刷新后与选择器状态不一致
      input.value = container.find('select[data-selected]:last').val();

      updateOptions(container.find('select:first'), categories);
    };

    // 下一级分类的 select
    var nextSelect = function(select){
      return $(select).closest('.form-group').next('.form-group').find('select');
    };

    // 隐藏后面的选择框
    var hideFollowingSelect = function(select){
      $(select).closest('.form-group').nextAll('.form-group').addClass('hide').find('select').prop('disabled', true);
    };

    // 更新选项
    var updateOptions = function(select, categories){
      select.closest('.form-group').removeClass('hide');
      select.prop('disabled', false);

      var html = '<option value="">请选择</option>';
      var i, len, category;
      for (i = 0, len = categories.length; i < len; ++i){
        category = categories[i];
        html += '<option value="' + category.id + '">' + category.name + '</option>';
      }

      select.html(html);

      var id = select.attr('data-selected');
      if (id) {
        select.val(id);
        select.trigger('change');
        select.removeAttr('data-selected');
      }
      else {
        select.val('');
        hideFollowingSelect(select);
      }
    };

    // 选项改变时，保存选中 id，并更新后代选项
    container.on('change', 'select', function(){
      var id = this.value;

      // 保存选中值
      if (id) {
        input.value = id;
      }

      // 选中且有子分类时，更新后代节点
      if (id && idToChildren[id]) {
        updateOptions(nextSelect(this), idToChildren[id]);
      }
      // 否则隐藏后代节点
      else {
        hideFollowingSelect(this);
      }
    });

    // 获取分类数据，初始化
    $.get(container.attr('data-api'), null, function(data){
      if (data && data.code === 0) {
        initializeSelector(data.data);
      }
      else {
        flashPrompt('获取产品分类信息失败');
      }
    });
  })();
});
