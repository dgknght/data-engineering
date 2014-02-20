Given /^I am on the (.+) page$/ do |page_identifier|
  visit path_for page_identifier
end

When /^I click "([^"]+)"$/ do |locator|
  click_on(locator)
end

When /^I attach file "([^"]+)" for "([^"]+)"$/ do |file_name, locator|
  full_path = "#{::Rails.root}/spec/fixtures/#{file_name}"

  puts "full_path=#{full_path}"

  attach_file(locator, full_path)
end

Then /^I should see the following (.+) table$/ do |identifier, expected|
  locator = "table.#{identifier}"
  html_table = find(locator)
  actual = parse_table(html_table)
  expected.diff!(actual)
end
