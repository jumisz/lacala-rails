if (window.location.href.indexOf('mercury_frame') > 0) {
  console.log('In admin site');
} else {
  $(document).ready(function(){
   $('.bxslider').bxSlider();
  });
}
