/* global $ */
$(function() {
  $('#show_storageAreaMenu').click(function(event){
    event.preventDefault();
    $('div#storageAreaMenu').slideToggle('slow');
  });
  $('#show_storageLocationMenu').click(function(event){
    event.preventDefault();
    $('div#storageAreaMenu').slideToggle('slow');
  });
});   