class CreatePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :points do |t|
      t.string :eventName
      t.string :eventType
      t.integer :pointAmount
      t.integer :userID
      t.date :submissionDate
      t.string :comments

      t.timestamps
    end
  end
end
