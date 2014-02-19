Given /^I am on the (.+) page$/ do |page_identifier|
  visit path_for page_identifier
end

When /^I click "([^"]+)"$/ do |locator|
  click_on(locator)
end

When /^I attach file "([^"]+)" for "([^"]+)"$/ do |locator, file_path|
  attach_file(locator, file_path)
end

Then /^I should see the following (.+) table$/ do |identifier, expected|
  locator = "table.#{identifier}"
  actual = find(locator)
  expected.diff!(actual)
end
