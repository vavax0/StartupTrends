IMGKit.configure do |config|


  config.wkhtmltoimage = Rails.root.join('bin', 'wkhtmltoimage-amd64').to_s if ENV['RACK_ENV'] == 'production'
  config.wkhtmltoimage = '/home/wkhtmltoimage'.to_s

  side_size = 1280
  crop_side_size = 1280

  config.default_options = { :quality => 90, :width   => side_size,
						                      :height  => side_size,
						                      "crop-w" => crop_side_size,
						                      "crop-h" => crop_side_size,
						                      "disable-smart-width" => true,
						                      "zoom" => 1}

end

