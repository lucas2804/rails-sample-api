class User < ApplicationRecord
  validates :password, length: { minimum: 6 }, allow_nil: true
  validates_uniqueness_of :email

  has_secure_password
end
