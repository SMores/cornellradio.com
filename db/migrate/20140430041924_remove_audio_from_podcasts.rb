class RemoveAudioFromPodcasts < ActiveRecord::Migration
  def change
    remove_attachment :podcasts, :audio
  end
end
