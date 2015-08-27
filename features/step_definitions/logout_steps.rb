Given(/^(.*?) is signed in$/) do |user|
  steps %Q{
    Given I am on the "users/sign_in" page
    Given I have a confirmed account with email #{user}
    Given email #{user} and password 12345678
    When I click on "Sign in"
  }
end

Then(/^I should be redirected to "(.*?)"$/) do |path|
  expect(page.current_path).to eq(path)
end

Then(/^not see the "(.*?)" link$/) do |link|
  # TODO find out how to check the user session has been logged out
  expect(page).not_to have_content(link)
end