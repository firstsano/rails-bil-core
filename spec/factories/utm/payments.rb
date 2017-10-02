FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :payment, class: Utm::Payment do
    payment_absolute { Faker::Number.decimal(2) }
    payment_incurrency { payment_absolute }

    trait :with_payment_method do
      payment_method
    end
  end
end
