class CreateShowUsers < ActiveRecord::Migration
  def change
    create_table :show_users do |t|
      t.integer :userID
      t.integer :showID

      t.timestamps
    end
    add_index :show_users, [:userID, :showID]
  end
end
