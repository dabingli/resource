$(function(){
  if (!document.querySelector('body.series-images')) {
    return;
  }

  // 清空选中文件，避免意外提交
  $('.tab-content form input[type=file]').val(null);

  // 初始化所有预览图
  $('.tab-content .image-previewer').each(function(){
    initializeImagePreviewer(this);
  });

  // 初始化表单
  $('.tab-content form').each(function(){
    var btn, ladda;
    btn = this.querySelector('.save');
    btn.classList.add('ladda-button');
    btn.setAttribute('data-style', 'zoom-in');
    btn.disabled = false;
    ladda = Ladda.create(btn);
    $.data(btn, 'ladda', ladda);
  });

  // 提交表单
  $('.tab-content form').on('submit', function(event){
    event.preventDefault();

    var ladda = $.data(this.querySelector('.save'), 'ladda');
    var form = this;
    ladda.start();

    $.ajax({
      method: 'POST',
      url: form.action,
      contentType: false,
      processData: false,
      data: new FormData(form),
      dataType: 'json',
      complete: function(xhr){
        ladda.stop();
        if (xhr.responseJSON) {
          if (xhr.responseJSON.code !== 0) {
            flashPrompt(xhr.responseJSON.msg || '提交失败');
          } else {
            flashPrompt('保存成功！');
            var src = xhr.responseJSON.image_url;
            form.querySelector('.image-previewer img').src = src;
            form.querySelector('.view-original-image a').href = src;
            form.querySelector('.view-original-image').classList.remove('hide');
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
});
