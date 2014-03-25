class RenameUserIdInShowUsers < ActiveRecord::Migration
  def change
    rename_column :show_users, :userID, :user_id
  end
end
