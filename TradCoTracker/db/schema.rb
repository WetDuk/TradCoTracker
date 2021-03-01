# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_301_082_928) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'
  create_table 'businesses', force: :cascade do |t|
    t.integer 'businessEventID'
    t.integer 'numOfPoints'
    t.date 'submissionDate'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'orgs', force: :cascade do |t|
    t.date 'eventDate'
    t.string 'eventName'
    t.boolean 'required'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'points', force: :cascade do |t|
    t.integer 'businessTableID'
    t.string 'events'
    t.integer 'points'
    t.string 'eventType'
    t.integer 'userID'
    t.integer 'speakingEventID'
    t.integer 'businessEventID'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'speakings', force: :cascade do |t|
    t.integer 'speakingEventID'
    t.integer 'numOfPoints'
    t.date 'submissionDate'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.integer 'userID'
    t.boolean 'isOfficer'
    t.date 'joinDate'
    t.string 'username'
    t.string 'password'
    t.string 'email'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
end
