/* global $ */
$(function() {
  $('#quantitySelector').change(function(){
    $('.quantities').hide();
    $('.' + $(this).val()).show();
  });
});   