class User < ActiveRecord::Base

  has_many :foods
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 4}

end
