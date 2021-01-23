class SleepCycleSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :start_sleep_time, :end_sleep_time, :total_sleep_time
end
