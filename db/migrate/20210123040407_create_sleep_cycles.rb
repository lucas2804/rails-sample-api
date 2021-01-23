class CreateSleepCycles < ActiveRecord::Migration[5.2]
  def change
    create_table :sleep_cycles do |t|
      t.integer :user_id
      t.datetime :start_sleep_time
      t.datetime :end_sleep_time
      t.integer :total_sleep_time

      t.timestamps
    end
  end
end
