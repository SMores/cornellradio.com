class RenamePodcastColumns < ActiveRecord::Migration
  def change
    rename_column :podcasts, :userID, :user_id
    rename_column :podcasts, :showID, :show_id
  end
end
