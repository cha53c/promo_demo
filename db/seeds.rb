# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed ( cuisine: or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create( cuisine: [{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create( cuisine: name: 'Emanuel', city: cities.first)
# User.create( cuisine: email: 'test@test1.com', password: 'password', password_confirmation: 'password')


Cuisine.create( cuisine: 'Indian')
Cuisine.create( cuisine: 'Japanese')
Cuisine.create( cuisine: 'British')
Cuisine.create( cuisine: 'Chinese')
Cuisine.create( cuisine: 'Mexican')
Cuisine.create( cuisine: 'Fusion')
Cuisine.create( cuisine: 'Vegetarian')
argentinian = Cuisine.create( cuisine: 'Argentinian')
Theme.create(name: 'Happy Hour')
Theme.create(name: 'Romantic')
Theme.create(name: 'Groups')
Theme.create(name: 'Afternoon Tea')
meal_deals =Theme.create(name: 'Meal Deals')
Theme.create(name: 'Golf')


# Client.create!(name: 'client1',
#                photo: Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/test_image.jpg', 'image/jpg'),
#                email: 'client1@test.com', tel: '0890775544', website: 'http://www.client1.com')

patagonia = Client.create!(name: 'Patagonia',
                        photo: Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/clients/patagonia.jpg', 'image/jpg'),
                        email: 'patagonia@test.com', tel: '0890775544', website: 'http://www.patagonia.com')

Promotion.create!(promo_type: "10% off", description: "Winter Offer", details: "10% off total bill every tuesday",
client_id: patagonia.id, cuisine_id: argentinian.id, theme_id: meal_deals,
image: Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/promotions/steak.jpg', 'image/jpg'),
starts: Date.today.strftime('%d-%m-%Y'), ends: (Date.today + 90).strftime('%d-%m-%Y'), tue:  '1',
)
