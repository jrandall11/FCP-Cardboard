/* global $ */
$(function(){
    $(document).ready(function(){
        var $input = $("input")
        $input = $("[data-behavior='autocomplete']")
        
        var options = {
            getValue: "name",
            url: function(phrase) {
              return "/search.json?q=" + phrase;
            },
            categories: [
              {
                listLocation: "storage_areas",
                header: "<strong>Storage Areas</strong>",
              },
              {
                listLocation: "storage_locations",
                header: "<strong>Storage Locations</strong>",
              }
            ],
            list: {
              onChooseEvent: function() {
                var url = $input.getSelectedItemData().url
                $input.val("")
                window.location.assign(url);
              }
            }
            
        }
        
        $input.easyAutocomplete(options)
    });
})