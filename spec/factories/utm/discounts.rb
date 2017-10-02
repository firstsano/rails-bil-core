FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :discount, class: Utm::Discount do
    incoming_rest { Faker::Number.decimal(2) }
    outgoing_rest { Faker::Number.decimal(2) }
    discount { Faker::Number.decimal(2) }
    discount_with_tax { discount * 1.2 }
    service_data
  end
end
