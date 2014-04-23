class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :url  => "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :path => "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    storage: :s3,
                    s3_credentials: "#{Rails.root}/config/aws.yml",
                    :styles => { :content => '800>', :thumb => '118x100#' },
                    bucket: 'cornell-radio-assets'

  validates_attachment_size :data, :less_than => 2.megabytes
  validates_attachment_presence :data
  validates_attachment_content_type :data, :content_type => %w(image/jpeg image/jpg image/png)  
  
  def url_content
    url(:content)
  end
end