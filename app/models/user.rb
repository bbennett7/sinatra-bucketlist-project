class User < ActiveRecord::Base
  has_secure_password

  has_many :experiences
  has_many :locations, through: :experiences
end

#A user has an email, password, name, and username, has many experiences and has many locations through experiences 
