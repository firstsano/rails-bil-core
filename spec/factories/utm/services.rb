FactoryGirl.define do
  factory :service, class: Utm::Service do
    service_type { Faker::Number.between(1, 10) }
    service_name { Faker::Lorem.sentence }
    comment { Faker::Lorem.sentence }

    trait :with_parent do
      association :parent, factory: :service
    end

    trait :with_periodic_service_data do
      after(:create) do |service, evaluator|
        create :periodic_service_data, id: service.id
      end
    end

    after(:build) do |service|
      class << service
        def readonly?
          false
        end
      end
    end
  end
end
