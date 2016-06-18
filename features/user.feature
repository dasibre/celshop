Feature: User Signup

  So that I can use shopping cart
  As a user
  I want to sign up for an account

  Scenario Outline: Signing Up
    Given I am on user sign up page
    And I submit form with "<name>" "<email>" "<password>"
    Then I should see "<message>"

    Examples: With valid details
      |     name   |      email       | password |       message                 |
      | Test User  | test@example.com | 123456   | Logged in as test@example.com |

    Examples: With invalid details
      |     name   |      email       | password |       message    |
      | Test User  | test-example.com | 123456   | Email is invalid |



