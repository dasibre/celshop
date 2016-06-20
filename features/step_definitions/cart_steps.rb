def order
	@order = Order.new
end

Given(/^Store has a "([^"]*)" on sale$/) do |product|
	@iphone = Product.create!(name: product, brand: 'Apple', price: '600.00')
end

Given(/^I want to buy the a new phone$/) do
	visit root_path
	page.find('#product').click
end

When(/^I click on "([^"]*)"$/) do |add_to_cart|
	click_button add_to_cart
	order.add_item(@iphone.id)
end

Then(/^I should see "([^"]*)" in my cart$/) do |item|
	click_button 'close'
	visit cart_path
	expect(page).to have_content(item)
end