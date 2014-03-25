json.array!(@show_users) do |show_user|
  json.extract! show_user, :id, :userID, :showID
  json.url show_user_url(show_user, format: :json)
end
