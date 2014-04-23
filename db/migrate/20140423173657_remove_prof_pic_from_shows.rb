class RemoveProfPicFromShows < ActiveRecord::Migration
  def change
    remove_column :shows, :profile_pic, :string
  end
end
