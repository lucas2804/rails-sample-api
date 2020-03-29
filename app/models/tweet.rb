class Tweet < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 140 }
  enum status: { active: 1, inactive: 0 }
end
