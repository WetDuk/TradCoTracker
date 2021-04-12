class AddEventToSearches < ActiveRecord::Migration[6.1]
  def change
    add_column :searches, :event, :string
  end
end
