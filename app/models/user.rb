class User < ActiveRecord::Base
  has_secure_password
  
  has_many :experiences
  has_many :locations, through: :experiences
end

#A user has an email, password, and username
