# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# $('#request_lavorazione_id').hide()



jQuery ->
  $('#request_pezzo_id').parent().hide()
  pezzos = $("#request_pezzo_id").html()
  console.log(pezzos)
  $("#request_azienda_id").change ->
    azienda = $("#request_azienda_id :selected").text()
    escaped_azienda = azienda.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(pezzos).filter("optgroup[label='#{escaped_azienda}']").html();
    console.log(options)
    if options
      $("#request_pezzo_id").html(options).parent().show()
    else
      $("#request_pezzo_id").empty().show()

  $('#request_lavorazione_id').parent().hide()
  lavoraziones = $("#request_lavorazione_id").html()
  console.log(lavoraziones)
  $("#request_pezzo_id").change ->
    pezzo = $("#request_pezzo_id :selected").text()
    escaped_pezzo = pezzo.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(lavoraziones).filter("optgroup[label='#{escaped_pezzo}']").html();
    console.log(options)
    if options
      $("#request_lavorazione_id").html(options).parent().show()
    else
      $("#request_lavorazione_id").empty().show()
      