class CreateShowUsers < ActiveRecord::Migration
  def change
    create_table :show_users do |t|
      t.string :userID
      t.string :showID

      t.timestamps
    end
    add_index :show_users, [:userID, :showID]
  end
end
