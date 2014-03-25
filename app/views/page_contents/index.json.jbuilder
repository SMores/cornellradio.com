json.array!(@page_contents) do |page_content|
  json.extract! page_content, :id, :title, :content
  json.url page_content_url(page_content, format: :json)
end
