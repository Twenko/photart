# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('#fileupload').fileupload({
    dataType: 'json',
    done: (e, data) ->
       file = data.result
    fail: (e, data) ->
       alert 'Upload failed'
  }) 