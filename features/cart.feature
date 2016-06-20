Feature: Add item to cart

  So I can purchase a product
  As a customer
  I want to add it to my cart

  @javascript
  Scenario: Add item to shopping cart
	Given Store has a "iphone 6" on sale
	Given I want to buy the a new phone
	When I click on "Add to cart"
	Then I should see "iphone 6" in my cart