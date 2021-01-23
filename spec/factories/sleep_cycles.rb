FactoryBot.define do
  factory :sleep_cycle do
    user_id { 1 }
    start_sleep_time { "2021-01-23 12:04:07" }
    end_sleep_time { "2021-01-23 12:04:07" }
    total_sleep_time { 1 }
  end
end
