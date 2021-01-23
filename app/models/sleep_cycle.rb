class SleepCycle < ApplicationRecord
  def update_total_time
    total = (Time.now - start_sleep_time).to_i
    update(total_sleep_time: total)
  end
end
