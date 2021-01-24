class SleepCycle < ApplicationRecord
  belongs_to :user

  scope :order_by_start_time, -> { order(start_sleep_time: :desc) }
  scope :past_week, -> { where('start_sleep_time >= ?', 1.week.ago) }

  def update_total_time
    update(total_sleep_time: Time.now - start_sleep_time)
  end
end
