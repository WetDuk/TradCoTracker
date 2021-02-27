class CreateOrgEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :org_events do |t|

      t.timestamps
    end
  end
end
