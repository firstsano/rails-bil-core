FactoryGirl.define do
  factory :payment, class: Utm::Payment do
    payment_absolute { Faker::Number.decimal(2) }
    payment_incurrency { payment_absolute }

    trait :with_payment_method do
      association :payment_method, factory: :payment_method, strategy: :build
    end

    after(:build) do |payment|
      class << payment
        def readonly?
          false
        end
      end
    end
  end
end
