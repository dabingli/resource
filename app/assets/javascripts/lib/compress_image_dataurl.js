this.compressImageDataURL = function(dataURL){
  // 1M 以内不压缩
  if (dataURL.length < 1048576) {
    return dataURL;
  }

  var canvas, context, image;
  canvas = document.createElement('canvas');
  context = canvas.getContext('2d');
  image = new Image();

  image.src = dataURL;
  canvas.width = image.width;
  canvas.height = image.height;
  context.drawImage(image, 0, 0);

  return canvas.toDataURL('image/jpeg', 0.75);
};
