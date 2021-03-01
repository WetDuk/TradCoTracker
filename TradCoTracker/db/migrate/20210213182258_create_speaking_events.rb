class CreateSpeakingEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :speaking_events do |t|
<<<<<<< Updated upstream
      t.int :speakingEventID
      t.int :numOfPoints
=======
      t.integer  :speakingEventID
      t.integer  :numOfPoints
>>>>>>> Stashed changes
      t.date :submissionDate

      t.timestamps
    end
  end
end
