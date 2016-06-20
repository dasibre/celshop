module ApplicationHelper
	def store_name
		'Celmatix Shop'
	end

	def total_cart_items
		current_order.item_quantity
	end

end
