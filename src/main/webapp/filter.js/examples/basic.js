$(function($) {
  
  $('#price_filter').val('1-3');
  $("#price_slider").slider({
    range:true,
    min: 1,
    max: 3,
    values:[1, 3],
    step: 1,
    slide: function(event, ui) {
      $("#price_range_label").html('Level' + ui.values[ 0 ] + ' - Level' + ui.values[ 1 ] );
      $('#price_filter').val(ui.values[0] + '-' + ui.values[1]).trigger('change');
    }
  });

  $('#stadiumName :checkbox').prop('checked', true);
  
  $(document).ready(function() {
    $.ajax({
      type: "GET",
      url: "listAll",
      dataType: 'json',
      success : function(data) {
        var result = data;
        console.log(result);
        
        FilterJS(result, "#service_list", {
          template: '#template',
          criterias:[
            {field: 'teamNo', ele: '#price_filter', type: 'range'},
            {field: 'stadiumName', ele: '#stadiumName :checkbox'}
          ],
          search: { ele: '#search_box' }
        });
      }
    })
  });



});
