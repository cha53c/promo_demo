Given(/^email (.*?) and password (\w+)$/) do |email, password|
  visit 'users/sign_in'
  User.create!(email: email, password: password, password_confirmation: password)
  fill_in 'email', with: email
  fill_in 'password', with: password
end

When(/^I click on "(.*?)"$/) do |arg1|
  click_on arg1
end

Then(/^I see (.*?) message$/) do  |message|
  expect(page).to have_content(message)
end
