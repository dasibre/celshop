class Cart
	attr_reader :items
	def initialize(item)
		@items = item || Array.new(0)
	end

	def add_item(item)
		@items.push(item)
	end

	def remove_item(item)
	end
end