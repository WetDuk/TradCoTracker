class CreateBusinessEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :business_events do |t|
      t.int :businessEventID
      t.int :numOfPoints
      t.date :submissionDate

      t.timestamps
    end
  end
end
