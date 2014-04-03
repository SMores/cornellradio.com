json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :show_id, :title, :blurb, :content
  json.url post_url(post, format: :json)
end
