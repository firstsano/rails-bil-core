FactoryGirl.define do
  factory :service do
    service_type { Faker::Number.between(1, 10) }
    service_name { Faker::Lorem.sentence }
    comment { Faker::Lorem.paragraph }

    after(:build) do |discount|
      class << discount
        def readonly?
          false
        end
      end
    end
  end
end
