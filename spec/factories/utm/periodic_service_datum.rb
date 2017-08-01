FactoryGirl.define do
  factory :periodic_service_data, class: Utm::PeriodicServiceData do
    cost { Faker::Number.decimal(2) }
    discount_method { Faker::Number.between(1, 20) }

    after(:build) do |instance|
      class << instance
        def readonly?
          false
        end
      end
    end
  end
end
