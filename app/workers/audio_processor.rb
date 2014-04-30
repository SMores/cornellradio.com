class AudioProcessor
  @queue = :audio_processor_queue

  def self.perform(podcast_id, audio_key)
    podcast = Podcast.find(podcast_id)
    podcast.key = audio_key
    podcast.remote_audio_url = podcast.audio.direct_fog_url(:with_path => true)
    podcast.save!
  end
end
