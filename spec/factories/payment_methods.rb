FactoryGirl.define do
  factory :payment_method, class: PaymentMethod do
    name { Faker::Lorem.word }

    after(:build) do |payment_method|
      class << payment_method
        def readonly?
          false
        end
      end
    end
  end
end
