class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :name
      t.string :bucketlist
      t.boolean :experienced, default: false
      t.integer :user_id
      t.integer :location_id 
    end
  end
end


#An experience has a name, bucketlist(life, spring, summer, winter, fall), and status, and belongs to a user and location (has user_id and location_id)
