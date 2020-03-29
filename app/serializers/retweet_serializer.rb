class RetweetSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :tweet_id, :status
end
