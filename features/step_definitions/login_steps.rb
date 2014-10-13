Given(/^password (\w+)$/) do |password|
  visit 'sessions/show'
  fill_in 'login_pass', :with => password
end

When(/^I click on sign in$/) do
  click_on 'Log in'
end

Then(/^I see (.*?) message$/) do  |message|
  expect(page).to have_content(message)
end
