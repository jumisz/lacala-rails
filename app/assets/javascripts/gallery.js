var ready = function(){
 
 
  $('a[href$="gallery"]').addClass('bold');

  Galleria.run('.galleria', {
    flickr: 'set:72157625790610133',
  });
};



$(document).on('page:load',ready);
$(document).ready(ready);
