class User < ApplicationRecord
  has_many :tweets

  validates_uniqueness_of :email

end
