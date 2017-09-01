FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :account, class: Utm::Account do
    after(:build) do |instance|
      class << instance
        def readonly?
          false
        end
      end
    end

    balance { Faker::Number.decimal(2) }
  end
end
