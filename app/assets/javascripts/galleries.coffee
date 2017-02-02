# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on "turbolinks:load", ->
  $('#gallery-modal').on 'shown.bs.modal', ->
    $('#gallery_category_ids', this).chosen
    	no_results_text: "No result found. Press enter to add..."
    	search_contains: true
    	width: "200px"
