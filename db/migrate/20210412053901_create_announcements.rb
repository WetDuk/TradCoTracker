class CreateAnnouncements < ActiveRecord::Migration[6.1]
  def change
    create_table :announcements do |t|
      t.string :header
      t.date :announceDate
      t.string :content

      t.timestamps
    end
  end
end
