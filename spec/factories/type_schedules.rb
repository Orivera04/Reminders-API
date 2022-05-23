FactoryBot.define do
  factory :type_schedule do
    id { rand(1000) }
    sequence(:name) { |number| "Every #{number} minutes" }
  end
end
