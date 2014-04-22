# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    name Faker::Name.name
    number Faker::Number.number(10)
    email Faker::Internet.free_email
  end
end
