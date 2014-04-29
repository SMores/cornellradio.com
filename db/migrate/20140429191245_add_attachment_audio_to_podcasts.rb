class AddAttachmentAudioToPodcasts < ActiveRecord::Migration
  def change
    remove_column :podcasts, :audio, :string
    add_attachment :podcasts, :audio
  end
end
