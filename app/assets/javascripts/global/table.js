$(function(){
  if (!document.querySelector('.page-main .management.table')){
    return;
  }

  $('.page-main .management.table tbody').on('click', '.delete', function(event){
    event.preventDefault();

    var tr = $(this).closest('tr');

    if (confirm('确定删除？')) {
      $.ajax({
        method: 'DELETE',
        url: this.href,
        dataType: 'json',
        complete: function(xhr){
          if (xhr.responseJSON && xhr.responseJSON.code === 0){
            tr.remove();
            flashPrompt('操作成功');
          }
          else {
            flashPrompt(xhr.responseJSON && xhr.responseJSON.msg || '操作失败');
          }
        }
      });
    }
  });
});
