Then(/^I should be on the user details page for user (.*?)$/) do |email|
  #  should on on users/:id
  expect(current_path).to eq(user_path(User.find_by_email(email)))
end

Then(/^I should not see '(.*?)'$/) do |text|
  expect(page).not_to have_content(text)
end
