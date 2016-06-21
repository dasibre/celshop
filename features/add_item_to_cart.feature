Feature: Add item to Shopping Cart

  So I can have items I want to purchase while shopping
  As a customer
  I want to add and item to my shopping cart

  @javascript
  Scenario: Add item to shopping cart
	Given Store has a "iphone 6" on sale
	Given I want to buy the a new phone
	When I click on "Add to cart"
	Then I should see "iphone 6" in my cart