class CreateMemberPoints < ActiveRecord::Migration[6.1]
  def change
    create_table :member_points do |t|
      t.int :businessTableID
      t.string :events
      t.int :points
      t.char :type
      t.int :userID
      t.int :speakingEventID
      t.int :businessEventID

      t.timestamps
    end
  end
end
