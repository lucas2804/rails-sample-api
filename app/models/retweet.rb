class Retweet < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  def self.top_retweets
    Retweet.group('tweet_id').limit(10)
      .order('count_id DESC, tweet_id DESC')
      .count(:id)
  end
end
