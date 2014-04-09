module ApplicationHelper
  def save_file(upload, name)
    path = Rails.root.join('public', 'uploaded', name)
    File.open(path, "wb") { |f| f.write(upload.read) }
  end
end
