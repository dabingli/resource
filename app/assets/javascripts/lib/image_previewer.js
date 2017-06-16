this.initializeImagePreviewer = function($container){
  // make sure it's jQuery object
  $container = $($container);

  $container.find('span').on('click', function(){
    $(this).prev('input').trigger('click');
  });

  var originalImage = $container.find('img').attr('src');

  $container.find('input').on('change', function(){
    if (this.files && this.files[0]) {
      if (this.files[0].size > 10485760) {
        flashPrompt('图片大小不能超过 10M');
        this.value = null;
        return;
      }

      var reader, container;
      reader = new FileReader();
      container = this.parentNode;
      reader.onload = function(event){
        var img;
        img = container.querySelector('img');
        if (img) {
          img.src = event.target.result;
        }
        else {
          img = document.createElement('img');
          img.src = event.target.result;
          container.appendChild(img);
          container.querySelector('.change').innerHTML = '点击修改';
        }
      };
      reader.onerror = function(event){};
      reader.readAsDataURL(this.files[0]);
    }
  });

  $container.find('input').triggerHandler('change');

  // Reset 表单时清除图片，或显示初始图片
  $container.closest('form').on('reset', function(){
    if (originalImage) {
      $container.find('img').attr('src', originalImage);
    }
    else {
      $container.find('img').remove();
    }
  });
};
