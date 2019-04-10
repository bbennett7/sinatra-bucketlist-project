class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :email
      t.string :password_digest 
    end
  end
end


#A user has an email, name, password, and username, has many experiences and has many locations through experiences
