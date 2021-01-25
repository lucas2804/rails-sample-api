class SleepCycleSerializer < ActiveModel::Serializer
  type 'data'
  attributes :id, :user_id, :start_sleep_time, :end_sleep_time, :length_of_sleep

  def length_of_sleep
    hours = if object.total_sleep_time
              (object.total_sleep_time / 3600.to_f).round(2)
            else
              0
            end

    "#{hours} hours"
  end
end
