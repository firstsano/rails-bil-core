FactoryGirl.define do
  factory :service, class: Service do
    service_type { Faker::Number.between(1, 10) }
    service_name { Faker::Lorem.sentence }
    comment { Faker::Lorem.sentence }

    after(:build) do |discount|
      class << discount
        def readonly?
          false
        end
      end
    end
  end
end
