Given(/^I signed in as (.*?)$/) do |user|
  steps %Q{
    Given I visit users/sign_in
    Given I have a confirmed account with email #{user}
    Given I fill in #{user} and 12345678
    When I click on "Sign in"
  }
end

Then(/^not see the "(.*?)" link$/) do |link|
  # TODO find out how to check the user session has been logged out
  expect(page).not_to have_content(link)
end