class Experience < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
end


#An experience has a name, and status, and belongs to a user and location (has user_id and location_id)
