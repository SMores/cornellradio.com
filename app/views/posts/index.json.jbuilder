json.array!(@posts) do |post|
  json.extract! post, :id, :userID, :showID, :title, :blurb, :content
  json.url post_url(post, format: :json)
end
