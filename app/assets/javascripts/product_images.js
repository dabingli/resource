// 商品列表页添加素材、素材列表页编辑素材
$(function(){
  if (!document.querySelector('.edit-product-images')) {
    return;
  }

  var modal = $('.edit-product-images');
  var imageTemplate = $('.edit-product-images .image.template').remove().removeClass('template');

  // 拖动排序
  modal.find('.images').each(function(){
    $(this).sortable();
  });

  // 添加图片
  modal.on('click', '.add', function(event){
    if (event.target.tagName === 'INPUT') {
      return;
    }
    $(this).find('input').trigger('click');
  });

  // 删除图片
  modal.on('click', '.image .delete', function(event){
    $(this).closest('.image').remove();
  });

  // 预览选中文件
  modal.on('change', 'input[type=file]', function(){
    if (!this.files.length) {
      return;
    }

    var container = $(this).closest('.form-group').find('.images');

    $.each(this.files, function(index, file){
      if (!/^image\/.*/.test(file.type)) {
        flashPrompt("'" + file.name + "' 不是合法的图片");
      } else if (file.size > 10485760) {
        flashPrompt("'" + file.name + "' 大小超过 10M");
      } else {
        var reader = new FileReader();
        var node = imageTemplate.clone();
        var input = node.find('input')[0];
        input.name = input.name.replace('_ID_', container.attr('data-category-id'));

        reader.onload = function(event){
          node.find('img')[0].src = compressImageDataURL(event.target.result);
          node.find('input').data('file', file);
          container.append(node);
        };

        reader.onerror = function(event){
          flashPrompt('读取文件失败');
        };

        reader.readAsDataURL(file);
      }
    });
  });

  // 页面加载后清空文件
  modal.find('input[type=file]').val(null);

  // 验证
  var validate = function(){
    var valid = true;

    modal.find('.images').each(function(){
      var maxCount, name;
      maxCount = +this.getAttribute('data-max-count');
      if (this.children.length > maxCount) {
        name = $(this).closest('.form-group').find('.control-label span:first').text();
        flashPrompt(name + "数量超出限制");
        valid = false;
        return false;
      }
    });

    return valid;
  };

  // 保存
  modal.find('.modal-footer .save').on('click', function(){
    if (!validate()) {
      return;
    }

    var btn = this;
    btn.classList.add('ladda-button');
    btn.setAttribute('data-style', 'zoom-in');

    var ladda = Ladda.create(btn);
    ladda.start();

    var form = modal.find('form');
    var data = new FormData();

    form.find('input[name], select[name]').each(function(){
      data.append(this.name, $(this).data('file') || this.value);
    });

    var methodInput = form[0].querySelector('input[name=_method]');
    $.ajax({
      url: form[0].action.replace('_ID_', modal.attr('data-sku-id')),
      method: (methodInput && methodInput.value) || form[0].method || 'POST',
      contentType: false,
      processData: false,
      data: data,
      dataType: 'json',
      complete: function(xhr){
        ladda.stop();

        if (xhr.responseJSON) {
          if (xhr.responseJSON.code !== 0) {
            flashPrompt(xhr.responseJSON.msg || '提交失败');
          } else {
            flashPrompt('保存成功！');
            modal.modal('hide');
          }
        } else if (xhr.status === 413) {
          flashPrompt('文件大小超出限制');
        } else if (xhr.status >= 500) {
          flashPrompt('服务器处理出错');
        } else {
          flashPrompt('提交失败');
        }
      }
    });
  });

  // 更新 modal 中的图片
  var updateModal = function(data){
    modal.find('.modal-footer .save').prop('disabled', false);

    modal.find('.images').each(function(){
      var container = $(this);
      var categoryId = container.attr('data-category-id');
      if (!data[categoryId]) {
        return;
      }

      var i, len, image, node, input;
      for (i = 0, len = data[categoryId].length; i < len; ++i){
        image = data[categoryId][i];
        node = imageTemplate.clone();
        input = node.find('input')[0];
        input.name = input.name.replace('_ID_', categoryId);
        input.value = image.id;
        node.find('img')[0].src = image.url;
        container.append(node);
      }
    });
  };

  // 素材列表页面
  // 进入编辑
  $('body.product-images .management').on('click', '.edit', function(){
    var tr = $(this).closest('tr');
    var skuId = tr.attr('data-id');
    modal.attr('data-sku-id', skuId);
    var api = modal.attr('data-query-api').replace('_ID_', skuId);

    modal.find('.modal-title').text(tr.find('td:first').text());
    modal.find('.modal-content').addClass('loading');
    // 清除上次打开时的图片
    modal.find('.images').empty();
    modal.modal('show');

    $.get(api, {_: Date.now()}, function(data){
      modal.find('.modal-content').removeClass('loading');
      modal.find('.modal-footer .save').prop('disabled', true);
      if (data && data.code === 0) {
        updateModal(data.data);
      } else {
        flashPrompt(data && data.msg || '请求失败');
      }
    }, 'json');
  });

  // 更新等级下拉选项
  var updateLevelSelect = function(data){
    var html, level;
    html = '';
    for (level in data) {
      html += '<option value="' + level + '">' + data[level] + '</option>';
    }
    modal.find('#level').html(html);
  };

  // 商品列表页面
  // 进入添加状态
  $('body.products .management').on('click', '.add-sku', function(){
    var tr = $(this).closest('tr');
    var id = tr.attr('data-id');
    modal.attr('data-sku-id', id);
    var api = modal.attr('data-query-sku-api');

    modal.find('.modal-title').text(tr.find('td:first').text());
    modal.find('.modal-content').addClass('loading');
    // 清除上次打开时的图片
    modal.find('.images').empty();
    modal.find('input[name=product_id]').val(id);
    modal.modal('show');

    $.get(api, {product_id: id, _: Date.now()}, function(data){
      modal.find('.modal-content').removeClass('loading');
      if (data && data.code === 0) {
        if (data.data) {
          updateLevelSelect(data.data);
        } else {
          modal.modal('hide');
          flashPrompt('无 SKU 可添加，请前往素材管理');
        }
      } else {
        modal.modal('hide');
        flashPrompt(data && data.msg || '请求失败');
      }
    });
  });
});
