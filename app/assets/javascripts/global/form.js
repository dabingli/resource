// 表单异步提交
$(function(){
  if (!document.querySelector('form.ajax-submit')) {
    return;
  }

  var btn, ladda, message, $message, showMessage;

  btn = document.querySelector('form.ajax-submit button[type=submit]');
  btn.classList.add('ladda-button');
  btn.setAttribute('data-style', 'zoom-in');
  btn.disabled = false;
  ladda = Ladda.create(btn);

  $(btn).closest('.form-group').addClass('actions');
  message = btn.parentNode.querySelector('.alert');

  if (!message) {
    message = document.createElement('div');
    message.style.display = 'none';
    message.className = 'alert';
    btn.parentNode.insertBefore(message, btn.parentNode.children[0]);
  }

  $message = $(message);

  showMessage = function(msg, isSuccess){
    message.className = isSuccess ? 'alert alert-success' : 'alert alert-danger';
    message.innerHTML = msg;
    $message.slideDown('slow');
  };


  $('form.ajax-submit').on('submit', function(event){
    event.preventDefault();
    $message.slideUp('slow');
    ladda.start();

    var methodInput = this.querySelector('input[name=_method]');
    $.ajax({
      url: this.action,
      method: (methodInput && methodInput.value) || this.method || 'POST',
      contentType: false,
      processData: false,
      data: new FormData(this),
      dataType: 'json',
      complete: function(xhr){
        ladda.stop();
        if (xhr.responseJSON) {
          if (xhr.responseJSON.code !== 0) {
            showMessage(xhr.responseJSON.msg || '提交失败');
          } else {
            var url = xhr.responseJSON.url || btn.getAttribute('data-url');
            var msg = (xhr.responseJSON.msg || '提交成功！') + (url ? '即将跳转...' : '');
            showMessage(msg, true);
            if (url) {
              setTimeout(function(){
                window.location.href = url;
              }, 600);
            }
          }
        } else if (xhr.status === 401) {
          showMessage('请先登录');
        } else if (xhr.status === 413) {
          showMessage('文件大小超出限制');
        } else if (xhr.status >= 500) {
          showMessage('服务器处理出错');
        } else {
          showMessage('提交失败');
        }
      }
    });
  });
});
