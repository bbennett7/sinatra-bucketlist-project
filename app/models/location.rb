class Location < ActiveRecord::Base
  has_many :experiences

  def slug
    full_name = "#{Self.city} #{Self.country}"
    self.fullname.downcase.gsub(/[^0-9a-z\- ]/, "").gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    location = Location.find{|location| location.slug == location}
  end
end

#A location has a name(city/country), and has many experiences
