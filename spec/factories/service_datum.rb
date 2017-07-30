FactoryGirl.define do
  factory :service_data, class: ServiceData do
    service_type { Faker::Number.between(1, 10) }
    service_name { Faker::Lorem.sentence }
    comment { Faker::Lorem.sentence }

    trait :with_parent do
      association :parent, factory: :service_data
    end

    after(:build) do |service_data|
      class << service_data
        def readonly?
          false
        end
      end
    end
  end
end
