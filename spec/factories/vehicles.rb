# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle do
    license_plate "ABC321"
    color { Faker::Commerce.color }
    year "2017"
    category_id 1
  end
end
