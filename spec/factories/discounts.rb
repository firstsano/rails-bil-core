FactoryGirl.define do
  factory :discount do
    account_id { Faker::Number.number(6) }
    incoming_rest { Faker::Number.decimal(2) }
    outgoing_rest { Faker::Number.decimal(2) }
    discount { Faker::Number.decimal(2) }
    discount_with_tax { discount * 1.2 }
    service_id { Faker::Number.between(1, 20) }
    service_type { Faker::Number.between(1, 20) }
    discount_period_id { Faker::Number.between(1, 20) }
    slink_id { Faker::Number.between(1, 20) }
    discount_date { DateTime.now.to_i }
    charge_type { Faker::Number.between(1, 20) }

    after(:build) do |discount|
      class << discount
        def readonly?
          false
        end
      end
    end
  end
end
