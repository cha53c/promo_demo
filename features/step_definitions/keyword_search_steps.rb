Given(/^The promotion exists$/) do
  # client = Client.create!(name: "testclient", tel: "123", email: "me@home.com",
  #                         website: "www.bookme.com",
  #                         photo: Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/promotions/test_image.jpg', 'image/jpg'))
  client = Client.create!(name: "testclient", tel: "123", email: "me@home.com",
                          website: "www.bookme.com",
                          photo: fixture_file_upload("#{Rails.root}/spec/fixtures/images/promotions/test_image.jpg", 'image/jpg'))
  Promotion.create!(client_id: client.id,
                    image: fixture_file_upload("#{Rails.root}/spec/fixtures/images/promotions/test_image.jpg", 'image/jpg'),
                    description: "Burger Madness",  promo_type: "2 for 1", wed: '1',
                    details: "Lorem ipsum dolor sit amet,",
                    starts: Date.today.strftime('%d-%m-%Y'), ends: Date.today.strftime('%d-%m-%Y'))
end

When(/^I search for '(.*?)'/) do |keyword|
  fill_in 'keyword', with: keyword
  click_on('submit_search')
end

Then(/^I should see promotions with '(.*?)'$/) do |keyword|
  expect(page).to have_content(keyword)
end
