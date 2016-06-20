class Order < ActiveRecord::Base
	has_many :order_items

	def add_item(item_id)
		order_items.new(product_id: item_id)
	end

	def item_quantity
		order_items.size
	end
end
