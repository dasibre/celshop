# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://cof feescript.org/

class Modal
	constructor: (modal) ->
		@modal = modal

	update: (product)->
		@modal.find('.modal-title').text(product.name)
		@modal.find('.modal-body').text(product.desc)
		@modal.find('button.add-to-cart').attr( "data-product-id", product.id)

	setButtonId: (id)->
	  @modal.find('.modal-footer.button.add-to-cart').attr(element,val)

getProduct = (context,callback) ->
	$product = $(context)
	url = $product.data('url') + '/' + $product.data('id')
	$.ajax({
		type: 'GET',
		dataType: 'json',
		url: url,
		success: (data) ->
			callback(data)
	})

displayModal = (modal,product) ->
	modal.update(product)
	$('#dialog').modal('show')

init = ->
	modal = new Modal($('.modal'))

	$('.thumbnail').click ->
		getProduct this, (product) ->
			displayModal(modal,product)

$(document).ready(init)