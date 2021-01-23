class CreateSleepCycles < ActiveRecord::Migration[5.2]
  def change
    create_table :sleep_cycles do |t|
      t.string :session_uuid
      t.integer :user_id, index: true
      t.datetime :start_sleep_time, index: true
      t.datetime :end_sleep_time
      t.integer :total_sleep_time, index: true
    end
  end
end
