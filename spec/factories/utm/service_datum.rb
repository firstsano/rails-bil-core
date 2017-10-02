FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :service_data, class: Utm::ServiceData do
    service_type { Faker::Number.number(4) }
    service_name { Faker::Lorem.sentence }
    comment { Faker::Lorem.sentence }

    trait :with_parent do
      after(:create) do |instance|
        instance.parent = create(:service_data)
        instance.save
      end
    end
  end
end
