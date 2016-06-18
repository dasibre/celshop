Feature: User Signup

  So that I can use shopping cart
  As a user
  I want to sign up for an account

  @wip
  Scenario: Signing Up with valid details
    Given I am on user sign up page
    And I submit form with
      | name       | email            | password |
      | Test User  | test@example.com | 123456   |
    Then I should be on store index page
     And I should be logged in as "test@example.com"



