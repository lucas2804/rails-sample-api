class RemoveRedundantColumnsTimestamp < ActiveRecord::Migration[5.2]
  def change
    remove_column :sleep_cycles, :created_at, :updated_at
  end
end
