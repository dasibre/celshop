# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://cof feescript.org/

class Modal
	constructor: (modal) ->
		@modal = modal

	update: (product)->
		@modal.find('.modal-title').text(product.name)
		@modal.find('.modal-body').text(product.desc)

	findElement: (el)->
		@modal.find(el)

	setElementAttr: (el,attribute,val)->
		$(el).attr(attribute, val)


addItemToCart = (item)->
	id =  item.attr('id')
	url = item.data('url') + '/' + id
	$.ajax({
		type: 'POST',
		dataType: 'json',
		url: url,
		success: (data) ->
			console.log(data)
	})

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
	modal.setElementAttr('.modal-footer button.add-to-carts','id',product.id)
	modal.findElement('.modal-footer button.add-to-carts').click () ->
		addItemToCart($(this))
	modal.update(product)
	$('#dialog').modal('show')

resetDialog = (modal)->
	$('#dialog').on('hidden.bs.modal', (event) ->
		modal.findElement('.modal-footer button.add-to-carts').off())

initApp = ->
	$('.thumbnail').click ->
		modal = new Modal($('.modal'))
		getProduct this, (product) ->
			displayModal(modal,product)
		resetDialog(modal)

$(document).ready(initApp)