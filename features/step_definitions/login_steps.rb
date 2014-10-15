Given(/^email (.*?) and password (\w+)$/) do |email, password|
  visit 'sessions/new'
  User.create!(email: email, password: 'abc123', password_confirmation: 'abc123')
  fill_in 'email', :with => email
  fill_in 'login_pass', :with => password
end

When(/^I click on sign in$/) do
  click_on 'Log in'
end

Then(/^I see (.*?) message$/) do  |message|
  expect(page).to have_content(message)
end
