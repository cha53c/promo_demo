Given(/^I am logged in$/) do
  # pending # express the regexp above with the code you wish you had
  visit 'sessions/new'
  User.create!(email: "test@test.com", password: 'abc123', password_confirmation: 'abc123')
  fill_in 'email', :with => "test@test.com"
  fill_in 'password', :with => 'abc123'
  click_on 'Log in'

  expect(page).to have_content('Log Out')
end

When(/^I click on 'log out'$/) do
  # pending # express the regexp above with the code you wish you had
  click_on 'Log Out'
end

Then(/^I should be redirected to the 'home page'$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^not see the 'log out' link$/) do
  # pending # express the regexp above with the code you wish you had
  expect(page).not_to have_content('Log Out')
end