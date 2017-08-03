FactoryGirl.define do
  factory :account, class: Utm::Account do
    balance { Faker::Number.decimal(2) }

    after(:build) do |instance|
      class << instance
        def readonly?
          false
        end
      end
    end
  end
end
