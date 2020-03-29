class Tweet < ApplicationRecord
  belongs_to :user

  validate :content, presence: true, length: 140
  enum status: { active: 1, inactive: 0}
end
