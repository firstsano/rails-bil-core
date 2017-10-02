FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :tariff, class: Utm::Tariff do
    name { Faker::Lorem.word }
  end
end
