var document_ready = function(){
 
  var href = window.location.href;
  var currentPage =href.substr(href.lastIndexOf('/') + 1);
  currentPage = currentPage.replace(/\b[a-z]/g, function(letter) {
    return letter.toUpperCase();
  })
  $('a[href$='+currentPage+']').addClass('bold');
};

var ready = function() {
  
  if (window.location.href.indexOf('mercury_frame') > 0) {
    console.log('In admin site');
    $('.invisible').show();
  } else {
   
      console.log('Enabling slider');
      $('.slider').cycle();
    

  }
  document_ready();

}

$(document).on('page:load',ready);
$(document).ready(ready);