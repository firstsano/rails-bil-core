FactoryGirl.define do
  factory :user, class: User do
    id { Faker::Number.number(4) }
    login { Faker::Lorem.characters(2) + Faker::Number.number(4) }
    full_name { Faker::Name.name_with_middle }
    actual_address { Faker::Address.street_address }
    mobile_phone { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
    status { "" }
    vist_account_id { Faker::Number.number(6) }

    trait :without_remote_calls do
      after(:build) do |instance|
        class << instance
          attr_accessor :utm_account

          def utm_account_id
            utm_account.id
          end
        end

        instance.utm_account = build :account, id: Faker::Number.number(4)
      end
    end
  end
end
