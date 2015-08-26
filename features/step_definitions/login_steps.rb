Given(/^I have a confirmed account with email (.*?)$/) do |email|
  User.create!(email: email, password: '12345678', password_confirmation: '12345678', confirmed_at: DateTime.new(1970,1,1))
end

Given(/^email (.*?) and password (\w+)$/) do |email, password|
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
end

When(/^I click on "(.*?)"$/) do |link|
  click_on link
end

Then(/^I see (.*?) message$/) do  |message|
  expect(page).to have_content(message)
end
