Faker::Config.locale = 'en-US'

FactoryGirl.define do
  factory :user_auth, class: Hash do
    sequence(:login) { |i| Faker::Lorem.word + "_#{i}" }
    password { Faker::Lorem.word }

    initialize_with { attributes }
  end

  factory :user, class: User do
    id { Faker::Number.number(4) }
    login { Faker::Lorem.characters(2) + Faker::Number.number(4) }
    full_name { Faker::Name.name_with_middle }
    actual_address { Faker::Address.street_address }
    mobile_phone { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
    status { "" }
    account_id { Faker::Number.number(6) }
  end
end
