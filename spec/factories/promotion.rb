require 'faker'
require 'factory_girl'

FactoryGirl.define do
  factory :promotion do
    promo_type "2 4 1"  # without faker
    # promo_type {Faker::Name.promo_type}
  end
end