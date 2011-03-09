

Given /^I am filling cardholder form with Firstname "([^\"]*)", Lastname "([^\"]*)", Phonenumber "([^\"]*)", Country "([^\"]*)", City "([^\"]*)", Address "([^\"]*)", Passportnumber "([^\"]*)"$/ do |firstname, lastname, phonenumber, country, city, address, passportnumber|
    fill_in "cardholder_firstname", :with => firstname
    fill_in "cardholder_lastname", :with => lastname
    fill_in "cardholder_phonenumber", :with => phonenumber
    fill_in "cardholder_country", :with => country
    fill_in "cardholder_city", :with => city
    fill_in "cardholder_address", :with => address
    fill_in "cardholder_passportnumber", :with => passportnumber
    click_button "Save"
end

Given /^I am filling card form with Cardnumber "([^\"]*)"$/ do |cardnumber|
    fill_in "card_cardnumber", :with => cardnumber
    click_button "Save"
end

Then /^I count "([^\"]*)"$/ do |tablename|
  puts "#{tablename}="+tablename.capitalize.constantize.all.count.to_s
end

Then /^I should have ([0-9]+) "([^\"]*)"$/ do |count, tablename|
	puts "#{tablename}="+tablename.capitalize.constantize.all.count.to_s+" | #{count}"
	tablename.capitalize.constantize.all.count.should == count.to_i
end

Given /^I am deleting cardholder$/ do
    click_button "Destroy"
end


Given /^I am logged in as "([^\"]*)" with password "([^\"]*)"$/ do |username, password|
  unless username.blank?
    visit login_url
    fill_in "Username", :with => username
    fill_in "Password", :with => password
    click_button "Log in"
  end
end

When /^I visit profile for "([^\"]*)"$/ do |username|
  user = User.find_by_username!(username)
  visit user_url(user)
end

Given /^I am sign up as "([^\"]*)" with email "([^\"]*)" and password "([^\"]*)"$/ do |login, email, password|
  unless login.blank?
    visit signup_url
    fill_in "Login", :with => login
    fill_in "Email", :with => email
    fill_in "Password", :with => password
    fill_in "Confirm Password", :with => password
    click_button "Sign up"
  end
end

Given /^I am filling login form with Login "([^"]*)" and Password "([^"]*)"$/ do |login, password|
    fill_in "login", :with => login
    fill_in "password", :with => password
    click_button "Log in"
end

Then /^I should have ([0-9]+) contact of User "([^\"]*)"$/ do |count, user_login|
  user_id = User.find_by_login(user_login)
  Kontakt.find_all_by_user_id(user_id).count == count.to_i
end


