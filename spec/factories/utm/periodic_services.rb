FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :periodic_service, class: Utm::PeriodicService do
    cost { Faker::Number.decimal(2) }
    discount_method { Faker::Number.between(1, 20) }

    after(:build) do |instance|
      class << instance
        def readonly?
          false
        end
      end

      service_data = create :service_data, :with_parent,
        service_type: Utm::PeriodicService::SERVICE_TYPES.sample
      instance.id = service_data.id
    end
  end
end
