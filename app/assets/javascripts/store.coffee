# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://cof feescript.org/

class Modal
	constructor: (modal) ->
		@modal = modal

	update: (product)->
		@modal.find('.modal-title').text(product.name)
		@modal.find('#description').text(product.desc)
		@modal.find('#brand').text(product.brand)
		@modal.find('#model-number').text(product.model)
		@modal.find('#price').text("$" + product.price + ".00")


	findElement: (el)->
		@modal.find(el)

	setElementAttr: (el,attribute,val)->
		$(el).attr(attribute, val)


addItemToCart = (item)->
	$('#dialog').modal('hide')
	id =  item.attr('id')
	url = item.data('url') + '/' + id
	$.ajax({
		type: 'POST',
		dataType: 'json',
		url: url,
		success: (data) ->
			updateCartItemCount(data)
	})


updateCartItemCount = (count)->
	$('.badge').text(count)

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
	modal.setElementAttr('.modal-footer button.add-to-cart','id',product.id)
	modal.findElement('.modal-footer button.add-to-cart').click () ->
		addItemToCart($(this))
	modal.update(product)
	$('#dialog').modal('show')

resetDialog = (modal)->
	$('#dialog').on('hidden.bs.modal', (event) ->
		modal.findElement('.modal-footer button.add-to-cart').off())

initApp = ->
	$('.thumbnail').click ->
		modal = new Modal($('.modal'))
		getProduct this, (product) ->
			displayModal(modal,product)
		resetDialog(modal)

$(document).ready(initApp)