class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :userID
      t.boolean :isOfficer
      t.date :joinDate
      t.string :username
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end
