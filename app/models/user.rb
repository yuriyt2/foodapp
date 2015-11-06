class User < ActiveRecord::Base

  has_many :foods
  has_secure_password

end
