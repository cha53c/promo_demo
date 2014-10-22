Given(/^I am logged in$/) do
  visit 'sessions/new'
  User.create!(email: "test@test.com", password: 'abc123', password_confirmation: 'abc123')
  fill_in 'email', :with => "test@test.com"
  fill_in 'password', :with => 'abc123'
  click_on 'Log in'

  expect(page).to have_content('Log Out')
end

When(/^I click on 'log out'$/) do
  click_on 'Log Out'
end

Then(/^I should be redirected to the log out page$/) do
  # pending # express the regexp above with the code you wish you had
  expect(page.current_path).to eq("/sessions/destroy")
end

Then(/^not see the 'log out' link$/) do
  expect(page).not_to have_content('Log Out')
end