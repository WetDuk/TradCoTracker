
class CreateBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses do |t|
      t.integer :pointTotal
      t.date :submissionDate

      t.timestamps
    end
  end
end
