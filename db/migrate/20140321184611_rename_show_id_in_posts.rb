class RenameShowIdInPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :showID, :show_id
  end
end
