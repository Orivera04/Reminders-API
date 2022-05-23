FactoryBot.define do
  factory :reminder do
    id { rand(1000) }
    chat_id { rand(1000) }
    message { ('a'..'z').to_a.shuffle.join }
    association :type_schedule, factory: :type_schedule
    hour_of_execution { "0" }
    interval_of_execution { 0 }
    schedules { "{}" }
  end
end
