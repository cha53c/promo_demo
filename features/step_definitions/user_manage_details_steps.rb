Then(/^I should be on the user details page for user (.*?)$/) do |email|
  #  should on on users/:id
  expect(current_path).to eq(user_path(User.find_by_email(email)))
end

Then(/^I should not see '(.*?)'$/) do |text|
  expect(page).not_to have_content(text)
end

Given(/^I am on edit user details page for (.*?)$/) do |email|
  visit(edit_user_registration_path(User.find_by_email(email)))
end

Given(/^I change the (.*?) field to (.*?)$/) do |field_name, value|
  fill_in field_name, with: value
end

Then(/^I fill in my current password$/) do
  fill_in 'user_current_password', with: '12345678'
end

Then(/^I should see '(.*?)' in field (.*?)$/) do |value, field_name|
  exepect(find(field_name)).to have_content(value)
end
