# Given(/^I am on the home page$/) do
#   # TODO this should use I visit x step
#   visit("/")
#   # TODO There is too much going on here, it needs to be moved to dry up the visit step
# end

Given(/^The promotion exists$/) do
  client = Client.create!(name: "testclient", tel: "123", email: "me@home.com",
                          website: "www.bookme.com",
                          photo: Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/promotions/test_image.jpg', 'image/jpg'))
  Promotion.create!(client_id: client.id,
                    image: Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/promotions/test_image.jpg', 'image/jpg'),
                    description: "Burger Madness",  promo_type: "2 for 1", wed: '1',
                    details: "Lorem ipsum dolor sit amet,",
                    starts: Date.today.strftime('%d-%m-%Y'), ends: Date.today.strftime('%d-%m-%Y'))
end

When(/^I enter a word for an existing promotion$/) do
  fill_in 'keyword', with: 'Burger'
  click_on('submit_search')
end

Then(/^I should see all the promotions with that word$/) do
  expect(page).to have_content("Madness")
end



Given(/^a keyword$/) do
  visit("/")
  fill_in 'keyword', with: 'Burger'
end

When(/^I search$/) do
  click_on('submit_search')
end

Then(/^I should see the message 'No results Found'$/) do
  expect(page).to have_content("No results found")
end