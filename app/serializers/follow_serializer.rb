class FollowSerializer < ActiveModel::Serializer
  type 'data'
  attributes :id, :user_id, :following_id
end
