FactoryGirl.define do
  factory :payment_method, class: Utm::PaymentMethod do
    name { |i| Faker::Lorem.word + i.to_s }

    after(:build) do |payment_method|
      class << payment_method
        def readonly?
          false
        end
      end
    end
  end
end
