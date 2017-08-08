FactoryGirl.define do
  factory :service_data, class: Utm::ServiceData do
    service_type { Faker::Number.number(4) }
    service_name { Faker::Lorem.sentence }
    comment { Faker::Lorem.sentence }

    trait :with_parent do
      association :parent, factory: :service_data
    end

    after(:build) do |instance|
      class << instance
        def readonly?
          false
        end
      end
    end
  end
end
