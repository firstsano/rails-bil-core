FactoryGirl.define do
  factory :vs_response, class: Hash do
    factory :vs_response_account do
      id { Faker::Number.number(4) }
    end

    factory :vs_response_user do
      id { Faker::Number.number(4) }
      login { Faker::Lorem.characters(2) + Faker::Number.number(4) }
      full_name { Faker::Name.name_with_middle }
      actual_address { Faker::Address.street_address }
      mobile_phone { Faker::PhoneNumber.phone_number }
      email { Faker::Internet.email }
      status { "" }
      account_id { Faker::Number.number(6) }
      association :account, factory: :vs_response_account, strategy: :build
    end

    trait :user do
      success true
      association :data, factory: :vs_response_user, strategy: :build
    end

    initialize_with { attributes }
  end
end
