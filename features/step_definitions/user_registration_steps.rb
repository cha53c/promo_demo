Given(/^I am on the Sign Up page$/) do
 visit 'users/sign_up'
end

When(/^I fill in email (.*?) and password (\w+)$/) do |email, password|
  # TODO add name
  fill_in 'user_email', :with => email
  fill_in 'user_password', :with => password
  fill_in 'user_password_confirmation', :with => password

end

When(/^I click on Sign Up$/) do
  # clear all the email deliveries, so we can easily checking the new ones
  ActionMailer::Base.deliveries.clear
  click_on 'Sign Up'
end

Then(/^I receive an 'email confirmation' email$/) do
  expect(ActionMailer::Base.deliveries.size).to eq(1)
  email = ActionMailer::Base.deliveries.last
  # TODO expect it to have a token link
  expect(email).to have_content('Confirm my account')
end


