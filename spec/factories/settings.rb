FactoryBot.define do
  factory :setting do
    id { rand(1000) }
    token_bot_api { ('a'..'z').to_a.shuffle.join }
    description { ('a'..'z').to_a.shuffle.join }
    association :formatting_style, factory: :formatting_style
  end
end
