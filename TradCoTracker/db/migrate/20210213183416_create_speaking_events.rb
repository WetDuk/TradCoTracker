class CreateSpeakingEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :speaking_events do |t|

      t.timestamps
    end
  end
end
