FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :tariff, class: Utm::Tariff do
    after(:build) do |instance|
      class << instance
        def readonly?
          false
        end
      end
    end

    name { Faker::Lorem.word }
  end
end
