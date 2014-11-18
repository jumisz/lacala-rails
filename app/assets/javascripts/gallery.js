var ready = function(){
 
  var href = window.location.href;
  var currentPage =href.substr(href.lastIndexOf('/') + 1);
  currentPage = currentPage.replace(/\b[a-z]/g, function(letter) {
    return letter.toUpperCase();
  })
  $('a[href$='+currentPage+']').addClass('bold');

  Galleria.run('.galleria', {
    flickr: 'set:72157625790610133',
  });
};



$(document).on('page:load',ready);
$(document).ready(ready);
