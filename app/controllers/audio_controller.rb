class AudioController < ApplicationController
  def new
    @uploader = Podcast.new.audio
    @uploader.success_action_redirect = new_podcast_url
  end
end