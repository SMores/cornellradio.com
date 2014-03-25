class AddLevelsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :level, :string
    add_index :users, :level
  end
end
