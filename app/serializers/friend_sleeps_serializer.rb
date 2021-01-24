class FriendSleepsSerializer < ActiveModel::Serializer
  type 'data'
  attributes :id, :email, :total_sleep_past_week

  def length_of_sleep
    hours = (object.total_sleep_time / 3600.to_f).round(2)

    "#{hours} hours"
  end

  def total_sleep_last_week
    object.total_sleep_past_week
  end
end

