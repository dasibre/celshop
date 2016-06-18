require 'pry'

Given(/^I am on user sign up page$/) do
	visit user_signup_path
end


Given(/^I submit form with "([^"]*)" "([^"]*)" "([^"]*)"$/) do |name, email, password|
	fill_in 'Name', with: name
	fill_in 'Email', with: email
	fill_in 'Password', with: password
	fill_in 'Password confirmation', with: password
	click_button 'Sign up'
end

Then(/^I should see "([^"]*)"$/) do |message|
	expect(page).to have_content(message)
end

And(/^I should be logged in as "([^"]*)"$/) do |email|
	expect(page).to have_content(email)
end

