FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :periodic_service, class: Utm::PeriodicService do
    after(:build) do |instance|
      service_data = create :service_data, :with_parent,
        service_type: Utm::PeriodicService::SERVICE_TYPES.sample
      instance.id = service_data.id
    end

    cost { Faker::Number.decimal(2) }
    discount_method { Faker::Number.between(1, 20) }

    trait :with_tariff do
      after(:build) do |instance|
        tariff = create(:tariff)
        instance.tariffs << tariff
        service_data = instance.service_data
        service_data.tariff_id = tariff.id
        service_data.save
      end
    end
  end
end
