FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :payment_method, class: Utm::PaymentMethod do
    sequence(:name) { |i| "#{Faker::Lorem.word}_#{i}" }
  end
end
