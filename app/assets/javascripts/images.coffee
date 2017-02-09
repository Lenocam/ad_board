# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on "turbolinks:load", ->
  $("#image-modal").on "shown.bs.modal", ->
    $("#image_category_ids", this).chosen
      no_results_text: "No results found. Pres enter to add..."
      search_contains: true
      width: "200px"
  $('.edit_image input[type=submit]').remove()

$ ->
  $('.edit_image input[type=checkbox]').click ->
    $(this).closest('form').submit()
    return
