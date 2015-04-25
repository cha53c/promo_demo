# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed ( cuisine: or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create( cuisine: [{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create( cuisine: name: 'Emanuel', city: cities.first)

User.create( email: 'test@test1.com', password: 'password', password_confirmation: 'password')


indian = Cuisine.create(cuisine: 'Indian')
japanese =Cuisine.create(cuisine: 'Japanese')
british = Cuisine.create(cuisine: 'British')
chinese = Cuisine.create(cuisine: 'Chinese')
mexican = Cuisine.create(cuisine: 'Mexican')
fusion = Cuisine.create(cuisine: 'Fusion')
vegetarian =Cuisine.create(cuisine: 'Vegetarian')
argentinian = Cuisine.create(cuisine: 'Argentinian')

happy_hour = Theme.create(name: 'Happy Hour')
romantic = Theme.create(name: 'Romantic')
groups = Theme.create(name: 'Groups')
afternoon_tea = Theme.create(name: 'Afternoon Tea')
meal_deals = Theme.create(name: 'Meal Deals')
golf = Theme.create(name: 'Golf')

address = Address.create!(line1: '101A Mandela House', country: 'The Plaza', town: 'La Linea De La Conception')


# Client.create!(name: 'client1',
#                photo: Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/test_image.jpg', 'image/jpg'),
#                email: 'client1@test.com', tel: '0890775544', website: 'http://www.client1.com')

patagonia = Client.create!(name: 'Patagonia', address_id: address.id,
                           photo: Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/clients/patagonia.jpg', 'image/jpg'),
                           email: 'patagonia@test.com', tel: '0890775544', website: 'http://www.patagonia.com')

Promotion.create!(promo_type: "10% off", description: "Winter Offer", details: "10% off total bill every tuesday",
                  client_id: patagonia.id, cuisine_id: argentinian.id, theme_id: meal_deals,
                  image: Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/promotions/steak.jpg', 'image/jpg'),
                  starts: Date.today.strftime('%d-%m-%Y'), ends: (Date.today + 90).strftime('%d-%m-%Y'), tue: '1')

jbs = Client.create!(name: 'JBs Cafe', address_id: address.id,
                           photo: Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/clients/jbs.jpg', 'image/jpg'),
                           email: 'jbs@test.com', tel: '0890775544', website: 'http://www.jbs.com')

Promotion.create!(promo_type: "2 for 1", description: "Curry Night", details: "Any two curry dishes for the price of one",
                  client_id: jbs.id, cuisine_id: indian.id, theme_id: meal_deals,
                  image: Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/promotions/steak.jpg', 'image/jpg'),
                  starts: Date.today.strftime('%d-%m-%Y'), ends: (Date.today + 90).strftime('%d-%m-%Y'), fri: '1', sat: '1')
