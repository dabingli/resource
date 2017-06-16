$(function(){
  if (!document.querySelector('body.site-skus .management.table')) {
    return;
  }

  var modal = $('.edit-site-sku.modal');
  var modalTitle = modal.find('.modal-title');
  var modalContent = modal.find('.modal-content');
  var queryApi = modal.attr('data-query-api');

  // 更新 modal 中 checkbox 的选中状态
  var updateModal = function(data){
    data = data || {};
    modalContent.removeClass('loading');
    modalContent.find('.site-skus-container li').each(function(){
      var siteInput = this.querySelector('.site input');
      var siteId = siteInput.value;
      if (data[siteId]) {
        siteInput.checked = true;
        $(this).find('.halls input').each(function(){
          this.checked = $.inArray(+this.value, data[siteId]) !== -1;
        });
      } else {
        $(this).find('input').prop('checked', false);
      }
    });
  };

  // 保存后更新表格中显示
  var updateTable = function(skuId){
    var sites, halls, html, i$, len$, site;
    sites = [];
    halls = {};
    modal.find('.site-skus-container li').each(function(){
      var siteInput, siteId, siteName;
      siteInput = this.querySelector('.site input');
      siteId = siteInput.value;
      if (siteInput.checked) {
        siteName = $(this.querySelector('.site')).text().trim().replace(/:|：/, '');
        sites.push(siteName);
        halls[siteName] = [];
        $(this).find('.halls input').each(function(){
          if (this.checked) {
            halls[siteName].push($(this.parentNode).text().trim());
          }
        });
      }
    });

    html = '';
    for (i$ = 0, len$ = sites.length; i$ < len$; ++i$) {
      site = sites[i$];
      // html += '<li>' + site + '：' + halls[site].join('、') + '</li>'
      html += "<li>" + site + "</li>";
    }

    $(".management tbody tr[data-id='" + skuId + "'] ul").html(html);
  };

  $('.management tbody').on('click', 'td .edit', function(){
    var tr, skuId;
    tr = $(this).closest('tr');
    skuId = tr.attr('data-id');

    modal.modal('show');
    modalContent.addClass('loading');
    modalTitle.text(tr.find('td.sku-name').text());
    modal.attr('data-sku-id', skuId);

    $.ajax({
      method: 'GET',
      url: queryApi.replace('_ID_', skuId),
      dataType: 'json',
      timeout: 5000,
      complete: function(xhr){
        modalContent.removeClass('loading');
        if (xhr.responseJSON && xhr.responseJSON.code === 0) {
          updateModal(xhr.responseJSON.data);
        }
        else {
          flashPrompt(xhr.responseJSON && xhr.responseJSON.msg || '请求失败');
          modal.modal('hide');
        }
      }
    });
  });

  // 确保平台的选中状态与商品馆的选中状态相符
  modal.on('change', 'input', function(){
    var li;
    li = $(this).closest('li');
    if (/^site/.test(this.id)) {
      // 取消选中平台时，取消选中该平台的所有商品馆
      if (!this.checked) {
        li.find('.halls input').prop('checked', false);
      }
    }
    else {
      // 选中商品馆时，确保所属平台是选中的
      if (this.checked) {
        li.find('.site input').prop('checked', true);
      }
    }
  });

  modal.find('.modal-footer .save').on('click', function(){
    var form, skuId, button;
    form = modal.find('form');
    skuId = modal.attr('data-sku-id');
    button = this;

    button.disabled = true;
    $.ajax({
      method: 'PUT',
      url: form.attr('action').replace('_ID_', skuId),
      data: form.serialize(),
      dataType: 'json',
      timeout: 10000,
      complete: function(xhr){
        button.disabled = false;
        if (xhr.responseJSON && xhr.responseJSON.code === 0) {
          updateTable(skuId);
          modal.modal('hide');
        }
        else {
          flashPrompt(xhr.responseJSON && xhr.responseJSON.msg || '保存失败');
        }
      }
    });
  });
});
