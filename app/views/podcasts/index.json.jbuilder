json.array!(@podcasts) do |podcast|
  json.extract! podcast, :id, :userID, :showID, :title, :audio, :description
  json.url podcast_url(podcast, format: :json)
end
