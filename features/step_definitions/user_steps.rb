require 'pry'

Given(/^I am on user sign up page$/) do
	visit user_signup_path
end

Given(/^I submit form with$/) do |table|
	user_credentials = table.hashes.first
	fill_in 'Name', with: user_credentials['name']
	fill_in 'Email', with: user_credentials['email']
	fill_in 'Password', with: user_credentials['password']
	fill_in 'Password confirmation', with: user_credentials['password']
	click_button 'Sign up'
end

Then(/^I should be on store index page$/) do
	expect(page).to have_content('Store#index')
end

And(/^I should be logged in as "([^"]*)"$/) do |email|
	expect(page).to have_content(email)
end

