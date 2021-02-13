class CreateSpeakingEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :speaking_events do |t|
      t.int :speakingEventID
      t.int :numOfPoints
      t.date :submissionDate

      t.timestamps
    end
  end
end
