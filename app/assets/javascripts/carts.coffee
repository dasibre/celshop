# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#add event to add to carts button
#event: on click, get product-id,
#make a post request to carts

initCart = ->
	$('.modal-footer button.add-to-carts').click ()->
	  $item = $(this)
	  console.log($item.attr('id'))

$(document).ready(initCart)