require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  expect(page).to have_content(text)
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  expect(page).not_to have_content(text)
end

Given /the following customers exist/ do |customers_table|
  customers_table.hashes.each do |customer|
    Customer.create!(customer)
  end
end

Then /(.*) seed customers should exist/ do | n_seeds |
  expect(Customer.count).to eq n_seeds.to_i
end

Given /the following workers exist/ do |workers_table|
  workers_table.hashes.each do |worker|
    Worker.create!(worker)
  end
end

Then /(.*) seed workers should exist/ do | n_seeds |
  expect(Worker.count).to eq n_seeds.to_i
end