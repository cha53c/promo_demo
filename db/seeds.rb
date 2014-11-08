# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed ( cuisine: or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create( cuisine: [{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create( cuisine: name: 'Emanuel', city: cities.first)
# User.create( cuisine: email: 'test@test1.com', password: 'password', password_confirmation: 'password')


Client.create!(name: 'client1',
              photo: Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/test_image.jpg', 'image/jpg'),
              email: 'client1@test.com', tel: '0890775544', website: 'http://www.client1.com')
Cuisine.create( cuisine: 'Indian')
Cuisine.create( cuisine: 'Japanese')
Cuisine.create( cuisine: 'British')
Cuisine.create( cuisine: 'Chinese')
Cuisine.create( cuisine: 'Mexican')
Cuisine.create( cuisine: 'Fusion')
Theme.create(name: 'Happy Hour')
Theme.create(name: 'Romantic')
Theme.create(name: 'Groups')
Theme.create(name: 'Afternoon Tea')
