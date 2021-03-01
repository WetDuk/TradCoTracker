class CreateOrgs < ActiveRecord::Migration[6.1]
  def change
    create_table :orgs do |t|
      t.date :eventDate
      t.string :eventName
      t.boolean :required

      t.timestamps
    end
  end
end
