CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAIB4YTLHWTO3NXLVA',                        # required
    :aws_secret_access_key  => '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',     # required
  }
  config.max_file_size     = 300.megabytes  
  config.fog_directory  = 'cornell-radio-assets'                     # required
end