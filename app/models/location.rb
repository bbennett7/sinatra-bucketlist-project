class Location < ActiveRecord::Base
  has_many :experiences
end

#A location has a name(city/country), and has many experiences 
