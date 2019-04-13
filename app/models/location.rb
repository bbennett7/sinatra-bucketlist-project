class Location < ActiveRecord::Base
  has_many :experiences

  def slug
    city = self.city.downcase.strip.gsub(/[^0-9a-z\-\b]/, "-")
    country = self.country.downcase.strip.gsub(/[^0-9a-z\-\b]/, "-")
    "#{city}-#{country}"
  end

  def self.find_by_slug(slug)
    location = Location.find{|location| location.slug == slug}
  end
end
