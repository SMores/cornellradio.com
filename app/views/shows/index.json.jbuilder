json.array!(@shows) do |show|
  json.extract! show, :id, :title, :profilePic, :description, :fbPage, :twPage, :extPage
  json.url show_url(show, format: :json)
end
