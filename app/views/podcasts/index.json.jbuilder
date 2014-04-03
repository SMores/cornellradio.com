json.array!(@podcasts) do |podcast|
  json.extract! podcast, :id, :user_id, :show_id, :title, :audio, :description
  json.url podcast_url(podcast, format: :json)
end
