class User < ActiveRecord::Base
  has_secure_password

  has_many :experiences
  has_many :locations, through: :experiences

  def slug
    self.username.downcase.gsub(/[^0-9a-z\- ]/, "").gsub(" ", "-")
  end

  def self.find_by_slug(username)
    user = User.find{|user| user.slug == username}
  end
end

#A user has an email, password, name, and username, has many experiences and has many locations through experiences
