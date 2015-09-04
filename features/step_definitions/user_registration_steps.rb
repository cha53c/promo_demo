Given(/^I visit (.*?)$/) do | path|
 visit path
end

When(/^I fill in sign up credentials (.*?), (.*?), (\w+)$/) do |name, email, password|
  fill_in 'user_name', with: name
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  fill_in 'user_password_confirmation', with: password

end

#   TODO I want this to go to the sign in page after clicking the link
Then(/^I receive an 'email confirmation' in (.*?)$/) do |email|
  expect(unread_emails_for(email).size).to eql 1
  open_email(@email)
  expect(current_email).to have_content('Confirm my account')
end

Then(/^I click on "(.*?)" link in email$/) do |link|
  visit_in_email(link)
end



