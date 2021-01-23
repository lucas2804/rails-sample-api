class SleepCycle < ApplicationRecord
  def update_total_time
    update(total_sleep_time: Time.now - start_sleep_time)
  end
end
