class RenameShowIdInShowUsers < ActiveRecord::Migration
  def change
    rename_column :show_users, :showID, :show_id
  end
end
