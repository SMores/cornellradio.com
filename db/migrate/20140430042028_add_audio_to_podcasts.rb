class AddAudioToPodcasts < ActiveRecord::Migration
  def change
    add_column :podcasts, :audio, :string
  end
end
