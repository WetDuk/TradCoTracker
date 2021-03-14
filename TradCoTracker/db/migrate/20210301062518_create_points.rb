# frozen_string_literal: true

class CreatePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :points do |t|
      t.integer :businessTableID
      t.string :events
      t.integer :points
      t.string :eventType
      t.integer :userID
      t.integer :speakingEventID
      t.integer :businessEventID

      t.timestamps
    end
  end
end
