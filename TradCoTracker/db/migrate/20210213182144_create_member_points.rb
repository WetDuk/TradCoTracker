class CreateMemberPoints < ActiveRecord::Migration[6.1]
  def change
    create_table :member_points do |t|
      t.numeric  :businessTableID
      t.string :events
      t.numeric  :points
      t.string :eventType
      t.numeric  :userID
      t.numeric  :speakingEventID
      t.numeric  :businessEventID

      t.timestamps
    end
  end
end
