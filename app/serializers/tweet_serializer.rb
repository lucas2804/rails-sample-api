class TweetSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :status, :user
  belongs_to :user
end
