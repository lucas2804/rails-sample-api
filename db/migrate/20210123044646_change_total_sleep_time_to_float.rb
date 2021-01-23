class ChangeTotalSleepTimeToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :sleep_cycles, :total_sleep_time, :float, index: true
  end
end
