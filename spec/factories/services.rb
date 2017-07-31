FactoryGirl.define do
  factory :service, class: Service do
    sequence(:id) { |i| i }

    trait :with_service_data do
      after(:build) do |service|
        create :service_data, id: service.id
      end
    end

    initialize_with { new(id: id) }
  end
end
