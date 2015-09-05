Given(/^user (.*?) exists$/) do |email|
  # User.create!(email: email, password: '12345678', password_confirmation: '12345678', confirmed_at: DateTime.new(1970,1,1))
  steps %Q{
    Given I have a confirmed account for email #{email}
  }
end

Given(/^I am on the user details page for (.*?)$/) do |email|
  visit(user_path(User.find_by_email(email)))
end

Then(/^I should see Admin only links$/) do
  steps %Q{
    And I should see 'Delete'
    And I should see 'Back to Users'
  }
end

Then(/^I should see User Audit data$/) do
  steps %Q{
    And I should see 'Role'
    And I should see 'Date Created'
    And I should see 'Confirmed at'
    And I should see 'Sign in count'
    And I should see 'Last signed in'
    And I should see 'Failed Login attempts'
  }
end

