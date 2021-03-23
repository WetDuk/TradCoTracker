class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.boolean :isOfficer
      t.string :joinDate
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :userID
      t.string :password_digest
      
      t.timestamps
    end
  end
end
