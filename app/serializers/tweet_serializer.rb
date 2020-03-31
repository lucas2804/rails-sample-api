class TweetSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :status, :user, :created_at, :updated_at, :number_of_retweet
  belongs_to :user

  def updated_at
    object.updated_at.strftime('%A %B %d, %Y at %I:%M %p')
  end
end
