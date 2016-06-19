# class Cart
# 	attr_reader :items
# 	def initialize(item)
# 		@items = item || Array.new(0)
# 	end
#
# 	def add_item(item)
# 		@items.push(item)
# 	end
#
# 	def remove_item(item)
# 	end
# end


Given(/^Store has a "([^"]*)" on sale$/) do |product|
	@iphone = Product.create!(name: product, brand: 'Apple', price: '600.00')
end

Given(/^I want to buy the a new phone$/) do
	visit root_path
	page.find('#product').click
end

When(/^I click on "([^"]*)"$/) do |add_to_cart|
	click_button add_to_cart
	@cart = Cart.new(@iphone)
end

Then(/^I should see "([^"]*)" in my cart$/) do |arg1|
	expect(@cart).to include(@iphone)
end