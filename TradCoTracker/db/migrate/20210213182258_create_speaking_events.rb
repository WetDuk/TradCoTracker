class CreateSpeakingEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :speaking_events do |t|
      t.numeric  :speakingEventID
      t.numeric  :numOfPoints
      t.date :submissionDate

      t.timestamps
    end
  end
end
