$(function(){
  if (document.body.className.indexOf('login') === -1) {
    return;
  }

  $('form img').on('click', function(){
    $('form input[type=submit]').trigger('click');
  });

  var $message = $('form .message');

  $('form').on('submit', function(event){
    event.preventDefault();
    $message.text('');

    $.post(this.action, $(this).serialize(), function(data){
      if (data.code === 0) {
        location.href = data.url;
      }
      else {
        $message.text(data.msg || '工号或密码错误');
      }
    }, 'json');
  });
});
