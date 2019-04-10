class Experience < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  def slug
    self.name.downcase.gsub(/[^0-9a-z\- ]/, "").gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    experience = Experience.find{|experience| experience.slug == slug}
  end
end


#An experience has a name, and status, and belongs to a user and location (has user_id and location_id)
