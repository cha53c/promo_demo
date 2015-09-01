Given(/^I have a confirmed account for email (.*?)$/) do |email|
  @confirmed_user = User.create!(email: email, password: '12345678', password_confirmation: '12345678', confirmed_at: DateTime.new(1970,1,1))
end

Given(/^I fill in (.*?) and (\w+)$/) do |email, password|
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
end

Given(/^I sign in as (.*?)$/) do |user|
  steps %Q{
    Given I visit users/sign_in
    Given I fill in #{user} and 12345678
    When I click on "Sign in"
  }
end

When(/^I click on "(.*?)"$/) do |link|
  click_on link
end

Then(/^I see (.*?) message$/) do  |message|
  expect(page).to have_content(message)
end

Then(/^I should be on the (.*?) page$/) do |path|
  expect(current_path).to eq(path)
end

# Given(/^I saved my promoters details$/) do
#   promoter_details = Client.create!(name: "Cucumbers are us")
#   @client_id = promoter_details.id
#   @confirmed_user.update({client_id: @client_id})
# end

Given(/^I saved my promoters details for (.*?)$/) do |email|
  User.find_by_email(email).update({client_id: Client.create!(name: "Cucumbers are us").id})
end

# Then(/^I should be on my promoters details page$/) do
#   expect(current_path).to eq("/clients/#{@client_id}")
# end

Then(/^I should be on my promoters details page for (.*?)$/) do |email|
  expect(current_path).to eq("/clients/#{User.find_by_email(email).client_id}")
end



