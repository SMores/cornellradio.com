class AddProfPicAttachmentToShows < ActiveRecord::Migration
  def change
    add_attachment :shows, :profile_pic
  end
end
