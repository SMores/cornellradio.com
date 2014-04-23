class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data,
                    :url => "/ckeditor_assets/attachments/:id/:filename",
                    :path => "/ckeditor_assets/attachments/:id/:filename"
                    # storage: :s3,
                    # s3_credentials: "#{Rails.root}/config/aws.yml",
                    # bucket: 'cornell-radio-assets'
  
  validates_attachment_size :data, :less_than => 100.megabytes
  validates_attachment_presence :data
  # validates_attachment_content_type :file_name, :content_type => %w(image/jpeg image/jpg image/png)
  
  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end
end