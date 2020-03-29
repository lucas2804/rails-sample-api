class CreateRetweets < ActiveRecord::Migration[5.2]
  def change
    create_table :retweets do |t|
      t.integer :user_id, index: true
      t.integer :tweet_id, index: true
      t.integer :status, index: true, limit: 3

      t.timestamps
    end
  end
end
