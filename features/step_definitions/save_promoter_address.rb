Given(/^I am signed in and have previously saved details for (.*?)$/) do |email|
  steps %Q{
    Given I have a confirmed account for email #{email}
    Given I saved my promoters details for #{email}
    Given I sign in as #{email}
    Then I should be on my promoters details page for #{email}
  }
end

When(/^I fill in address with (.*?), (.*?)$/) do |line1, line2|
  fill_in 'First line', with: line1
  fill_in 'Second line', with: line2
end

Then(/^I should see '(.*?)'$/) do |text|
  expect(page).to have_content(text)
end

