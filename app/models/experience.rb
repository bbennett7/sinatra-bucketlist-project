class Experience < ActiveRecord::Base
  belongs_to :user
  belongs_to :location 
end


#An experience has a name, description, status
