Given(/^I am on the Sign Up page$/) do
 visit 'users/sign_up'
end

When(/^I fill in email (.*?) and password (\w+)$/) do |email, password|
  # TODO add name
  @user_mail = email
  fill_in 'user_email', :with => email
  fill_in 'user_password', :with => password
  fill_in 'user_password_confirmation', :with => password

end

When(/^I click on Sign Up$/) do
  # clear all the email deliveries, so we can easily checking the new ones
  ActionMailer::Base.deliveries.clear
  click_on 'Sign Up'
#   TODO I want this to go to the sign in page after clicking the link
end

Then(/^I receive an 'email confirmation' email$/) do
  expect(unread_emails_for(@user_mail).size).to eql 1
  open_email(@user_mail)
  # expect(ActionMailer::Base.deliveries.size).to eq(1)
  # email = ActionMailer::Base.deliveries.last
  # # TODO expect it to have a token link
  expect(current_email).to have_content('Confirm my account')
  # expect(email).to have_content('Confirm my account')
end

Then(/^I click on "(.*?)" link in email$/) do |arg1|
  # click_email_link_matching arg1
  visit_in_email(arg1)
  # expect(request.url).to
  # click_first_link_in_email
end



