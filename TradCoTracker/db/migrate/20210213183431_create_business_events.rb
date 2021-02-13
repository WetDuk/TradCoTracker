class CreateBusinessEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :business_events do |t|

      t.timestamps
    end
  end
end
