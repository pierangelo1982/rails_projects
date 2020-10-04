jQuery(function(){
  pezzos = $("#request_pezzo_id").html()
  console.log(pezzos)
  $("#request_azienda_id").click ->
    azienda = $("#request_azienda_id :selected").text()
    escaped_azienda = azienda.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(pezzos).filter("optgroup[label='#{escaped_azienda}']").html();
    console.log(options)
    if options
      $("#request_pezzo_id").html(options)
    else
      $("#request_pezzo_id").empty()

});



jQuery(function(){
# $('#request_lavorazione_id').parent().hide()
  lavoraziones = $("#request_lavorazione_id").html()
  console.log(lavoraziones)
  $("#request_pezzo_id").click ->
    pezzo = $("#request_pezzo_id :selected").text()
    escaped_pezzo = pezzo.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(lavoraziones).filter("optgroup[label='#{escaped_pezzo}']").html();
    console.log(options)
    if options
      $("#request_lavorazione_id").html(options).parent().show()
    else
      $("#request_lavorazione_id").empty().show()

    });
