class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.integer :user_id, index: true
      t.integer :following_id, index: true

      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
