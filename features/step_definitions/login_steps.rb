Given(/^I am on the login page$/) do
  # pending # express the regexp above with the code you wish you had
  visit 'sessions/login'
end

When(/^I enter my password$/) do
  # pending # express the regexp above with the code you wish you had
  fill_in 'login_pass', :with => "abc123"
end

When(/^I click log in$/) do
  # pending # express the regexp above with the code you wish you had
  click_button 'Log in'
end

Then(/^I see the welcome message$/) do
  # pending # express the regexp above with the code you wish you had
  click_button 'Log in'
  # TODO using default Capybara instead of Webrat!!
  expect(page).to have_content("Welcome")
end