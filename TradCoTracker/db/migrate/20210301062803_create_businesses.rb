# frozen_string_literal: true

class CreateBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses do |t|
      t.integer :businessEventID
      t.integer :numOfPoints
      t.date :submissionDate

      t.timestamps
    end
  end
end
