# frozen_string_literal: true

class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :username
      t.string :email
      t.decimal :min_points
      t.decimal :max_points

      t.timestamps
    end
  end
end
