class CreateOrgEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :org_events do |t|
      t.daterange :upcomingActivities
      t.date :date
      t.string :name
      t.bool :required

      t.timestamps
    end
  end
end
