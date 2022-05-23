FactoryBot.define do
  factory :formatting_style do
    id { rand(1000) }
    sequence(:name) { |number| "MarkdownV#{number}" }
  end
end
