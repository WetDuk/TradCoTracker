# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change # rubocop:todo Metrics/MethodLength
    create_table :users do |t|
      t.boolean  :isOfficer
      t.date     :joinDate
      t.string   :firstName
      t.string   :lastName
      t.string   :username
      t.string   :password
      t.string   :email
      t.string   :userID
      t.timestamps
    end
  end
end
