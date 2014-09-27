require 'factory_girl'

FactoryGirl.define do
  sequence(:name) { |n| "Restaurant #{n}" }
  sequence(:email) { |n| "restaurant#{n}@example.com" }
  sequence(:promo_type) { |n| "promo-#{n}" }

  factory :client do
    promotion
    name
    delivery true
    email
    tel "0044134135"
    website "http://whatever.com"
    photo_file_name "photo.jpg"
    photo_content_type "jpg"
    photo_file_size "1024"
  end

  factory :promotion do
    promo_type
    # client_id
    # t.string   image_file_name
    # t.string   image_content_type
    # t.integer  image_file_size
    # t.datetime image_updated_at
    # t.text     description
    # t.boolean  active
    # t.time     from
    # t.time     to
    starts Date.new(2014, 01, 01)
    ends  Date.new(2014, 01, 01)
    # t.string   valid_days
    # t.boolean  mon
    # t.boolean  tue
    # t.boolean  wed
    # t.boolean  thu
    # t.boolean  fri
    # t.boolean  sat
    # t.boolean  sun
    # t.text     details
  end
end