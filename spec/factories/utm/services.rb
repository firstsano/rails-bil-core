FactoryGirl.define do
  factory :service, class: Utm::Service do
    service_type { Faker::Number.between(1, 10) }
    service_name { Faker::Lorem.sentence }
    comment { Faker::Lorem.sentence }

    trait :with_parent do
      association :parent, factory: :service
    end

    trait :with_periodic_service_data do
      after(:build) do |service|
        klass = service.class
        service.service_type = klass::PERIODIC_SERVICE_TYPES.sample
      end

      after(:create) do |service|
        create :periodic_service_data, id: service.id
      end
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
