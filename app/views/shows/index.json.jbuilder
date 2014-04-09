json.array!(@shows) do |show|
  json.extract! show, :id, :title, :profile_pic, :description, :fb_page, :tw_page, :ext_page
  json.url show_url(show, format: :json)
end
