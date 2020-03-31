class Tweet < ApplicationRecord
  attribute :number_of_retweet
  belongs_to :user

  validates :content, presence: true, length: { maximum: 140 }
  enum status: { active: 1, inactive: 0 }


  def self.not_top_tweets(tweets_ids)
    Tweet.includes(:user).where.not(id: tweets_ids).order(id: :desc).limit(10)
  end
end
