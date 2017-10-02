FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :account, class: Utm::Account do
    balance { Faker::Number.decimal(2) }
  end
end
