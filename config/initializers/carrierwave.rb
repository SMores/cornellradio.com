CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['AWS_PUBLIC'],            # required
    :aws_secret_access_key  => ENV['AWS_SECRET'],            # required
  }
  config.max_file_size     = 300.megabytes  
  config.fog_directory  = 'cornell-radio-assets'                     # required
end