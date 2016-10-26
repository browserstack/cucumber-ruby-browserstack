require 'rspec'
require 'selenium-webdriver'

Given /^that I am on the Google Search page$/ do
  @browser.navigate.to 'http://www.google.com/ncr'
end

When /^I add "(.*)" to the search box$/ do |item|
  @browser.find_element(:name, 'q').send_keys(item)
end

And /^click the Search Button$/ do
  @browser.find_element(:name, 'btnG').click
end

Then(/^the title should be "([^"]*)"$/) do |item|
  @wait.until { @browser.title.include? item }
  expect(@browser.title).to include(item)
end

When(/^I visit "([^"]*)" page$/) do |page_url|
  @browser.navigate.to "http://#{page_url}"
end

Then(/^the page should contain the text "([^"]*)"$/) do |text|
  expect(@browser.page_source.downcase).to include(text.downcase)
end
