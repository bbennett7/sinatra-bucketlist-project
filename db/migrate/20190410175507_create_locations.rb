class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :city
      t.string :country 
    end
  end
end


#A location has a city, country, and has many experiences
