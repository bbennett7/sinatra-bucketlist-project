class Experience < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  def slug
    self.name.downcase.strip.gsub(/[^0-9a-z\-\b]/, "-")
  end

  def self.find_all_by_slug(slug)
    experience_matches = Experience.select{|experience| experience.slug == slug}
  end
end
