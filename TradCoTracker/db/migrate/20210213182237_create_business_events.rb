class CreateBusinessEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :business_events do |t|
<<<<<<< Updated upstream
      t.int :businessEventID
      t.int :numOfPoints
=======
      t.integer  :businessEventID
      t.integer  :numOfPoints
>>>>>>> Stashed changes
      t.date :submissionDate

      t.timestamps
    end
  end
end
