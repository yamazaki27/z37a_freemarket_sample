FactoryBot.define do
  factory :sitem do
    name { Faker::Book.genre }
  end
end
