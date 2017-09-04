FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :payment_method, class: Utm::PaymentMethod do
    after(:build) do |instance|
      class << instance
        def readonly?
          false
        end
      end
    end

    sequence(:name) { |i| "#{Faker::Lorem.word}_#{i}" }
  end
end
