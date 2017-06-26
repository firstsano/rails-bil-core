FactoryGirl.define do
  factory :user_auth, class: Hash do
    sequence(:login) { |i| Faker::Lorem.word + "_#{i}" }
    password { Faker::Lorem.word }

    initialize_with { attributes }
  end
end
