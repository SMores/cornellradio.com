module ApplicationHelper
  def save_image(upload, name)
    path = Rails.root.join('public', 'uploaded', name)
    File.open(path, "wb") { |f| f.write(upload.read) }
  end

  def save_audio(upload, name)
    path = Rails.root.join('public', 'audios', name)
    File.open(path, "wb") { |f| f.write(upload.read) }
  end
end
