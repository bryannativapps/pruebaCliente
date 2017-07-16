# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tour do
    vehicle_id 1
    passenger_id 1
    from { Faker::Address.city }
    to { Faker::Address.city }
  end
end
