# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    line1 "MyString"
    line2 "MyString"
    town "MyString"
    country "MyString"
    zip_code "MyString"
  end
end
