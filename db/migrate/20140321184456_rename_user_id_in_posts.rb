class RenameUserIdInPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :userID, :user_id
  end
end
