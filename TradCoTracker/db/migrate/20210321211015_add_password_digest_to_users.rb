class AddPasswordDigestToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :table_name, :column_name, :date
  end
end
