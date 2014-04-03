class RenameShowsColumns < ActiveRecord::Migration
  def change
    rename_column :shows, :profilePic, :profile_pic
    rename_column :shows, :fbPage, :fb_page
    rename_column :shows, :twPage, :tw_page
    rename_column :shows, :extPage, :ext_page
  end
end
