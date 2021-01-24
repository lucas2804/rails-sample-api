class User < ApplicationRecord
  validates_uniqueness_of :email

  has_many :tweets
  has_many :sleep_cycles

  has_many :follows

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :user_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following
  alias :friends :following

  def follow!(following_id)
    Follow.find_or_create_by!(following_id: following_id, user_id: id)
  end

  def un_follow!(following_id)
    follow = Follow.find_by(following_id: following_id, user_id: id)
    follow.delete! if follow
  end

  def sleep_cycles_past_week
    if sleep_cycles.past_week.present?
      (sleep_cycles.past_week.sum(&:total_sleep_time).to_f / 3600.to_f).round(2)
    else
      0
    end
  end

  def total_friend_sleeps_past_week
    User.joins(:sleep_cycles)
        .where('users.id': friends.pluck(:id))
        .group('users.id')
        .merge(SleepCycle.past_week)
        .order('sum_sleep_cycles_total_sleep_time DESC')
        .sum('sleep_cycles.total_sleep_time')
  end
end
