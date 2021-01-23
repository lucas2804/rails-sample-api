class FollowSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :following_id
end
