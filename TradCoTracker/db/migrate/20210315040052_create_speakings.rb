# frozen_string_literal: true

class CreateSpeakings < ActiveRecord::Migration[6.1]
  def change
    create_table :speakings do |t|
      t.integer :pointTotal
      t.date :submissionDate

      t.timestamps
    end
  end
end
