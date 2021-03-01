class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
<<<<<<< Updated upstream
      t.int :userID
      t.bool :isOfficer
=======
      t.integer :userID
      t.boolean :isOfficer
>>>>>>> Stashed changes
      t.date :joinDate
      t.string :username
      t.string :email

      t.timestamps
    end
  end
end
