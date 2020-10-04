# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".new_car_owner").on "ajax:success", (event, data, status, xhr) ->
    $('#myModal').modal('hide')
    $('#car_owner_id').append("<option value=" + data.id  + " selected >" + data.denominazione + "</option>")
