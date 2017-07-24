FactoryGirl.define do
  factory :user, class: User do
    id { Faker::Number.number(4) }
    login { Faker::Lorem.characters(2) + Faker::Number.number(4) }
    full_name { Faker::Name.name_with_middle }
    actual_address { Faker::Address.street_address }
    mobile_phone { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
    status { "" }
    vist_account { Faker::Number.number(6) }
  end
end
