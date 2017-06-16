$(function(){
  if (!document.querySelector('body.export-prices .management.table')) {
    return;
  }

  var tbody, api, validate;

  tbody = $('.management tbody');
  api = tbody.attr('data-api');

  // 数据合法时才允许保存
  validate = function(tr){
    var valid = true;

    tr.find('input[type=text]').each(function(){
      // 允许为空，但不允许非法值
      if (this.value.trim() && !/^\d+(\.\d+)?$/.test(this.value.trim())) {
        valid = false;
        return false;
      }
    });

    tr.find('.save').prop('disabled', !valid);
  };

  // 进入编辑状态
  tbody.on('click', '.edit', function(){
    var tr = $(this).closest('tr');
    tr.addClass('editing');

    tr.find('td > span').each(function(){
      var span, value;
      span = $(this);
      value = span.text().trim();
      if (span.next().is('.form-control')) {
        span.next().val(value);
      } else {
        if (value === '片') {
          tr.find('input[type=radio]:first').prop('checked', true);
        } else if (value === '方') {
          tr.find('input[type=radio]:last').prop('checked', true);
        } else {
          tr.find('input[type=radio]').prop('checked', false);
        }
      }
    });

    // 触发验证
    validate(tr);
  });

  // 保存
  tbody.on('click', '.save', function(){
    var tr = $(this).closest('tr');
    var ladda = Ladda.create(this);
    ladda.start();

    $.ajax({
      method: 'POST',
      url: api,
      data: tr.find('input').serialize(),
      dataType: 'json',
      complete: function(xhr){
        ladda.stop();
        if (xhr.responseJSON && xhr.responseJSON.code === 0) {
          tr.find('td > span').each(function(){
            var span = $(this);
            if (span.next().is('.form-control')) {
              span.text(span.next().val());
            }
            else {
              switch (tr.find('input[type=radio]:checked').val()) {
              case '1':
                span.text('片');
                break;
              case '2':
                span.text('方');
                break;
              default:
                span.text('');
              }
            }
          });

          flashPrompt('保存成功');
          tr.removeClass('editing');
        }
        else {
          flashPrompt(xhr.responseJSON && xhr.responseJSON.msg || '保存失败');
        }
      }
    });
  });

  // 取消
  tbody.on('click', '.cancle', function(){
    $(this).closest('tr').removeClass('editing');
  });

  // 值变化时重新验证
  tbody.on('change input', 'input', function(){
    validate($(this).closest('tr'));
  });
});
