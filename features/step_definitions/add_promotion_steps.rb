Given(/^I am on the new promotion page for a client$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I submit the details$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the new promotion$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^see success message$/) do
  pending # express the regexp above with the code you wish you had
end


Given(/^I am on the new promotion page$/) do
  client = Client.create!(name: "testclient", tel: "123", email: "me@home.com",
                          website: "www.bookme.com",
                          photo: Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/test_image.jpg', 'image/jpg'))
  url = "clients/" + client.id.to_s + "/promotions/new"
  visit(url)
end

Given(/^I leave the  form blank$/) do
#   no need to add any fields here
end

# TODO can this be reused with client
When(/^I submit new promotion$/) do
  click_on('Save Promotion')
end

# TODO can this be reused with client message
Then(/^I should see a failed promotion message$/) do
  expect(page).to have_content("Failed to add new promotion")
end
