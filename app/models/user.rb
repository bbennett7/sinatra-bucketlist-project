class User < ActiveRecord::Base
  has_secure_password

  has_many :experiences
  has_many :locations, through: :experiences

   def slug
     self.username.downcase.strip.gsub(/[^0-9a-z\-\b]/, "-")
   end

  def self.find_by_slug(username)
    user = User.find{|user| user.slug == username}
  end
end
