FactoryGirl.define do
  factory :discount, class: Discount do
    account_id { Faker::Number.number(6) }
    incoming_rest { Faker::Number.decimal(2) }
    outgoing_rest { Faker::Number.decimal(2) }
    discount { Faker::Number.decimal(2) }
    discount_with_tax { discount * 1.2 }
    service

    after(:build) do |discount|
      class << discount
        def readonly?
          false
        end
      end
    end
  end
end
