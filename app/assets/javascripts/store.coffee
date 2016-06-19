# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://cof feescript.org/

getProduct = (context) ->
	$product = $(context)
	url = $product.data('url') + '/' + $product.data('id')
	$.ajax({
		type: 'GET',
		dataType: 'json',
		url: url,
		success: (data) ->
			return data
	})

displayModalFor = () ->
	$('#dialog').modal('show')

init = ->
	$('.modal').on 'show.bs.modal', () ->
		modal = $(this)
		modal.find('.modal-title').text('Hello Nurse')

	$('.thumbnail').click ->
		displayModalFor(getProduct(this))

$(document).ready(init)