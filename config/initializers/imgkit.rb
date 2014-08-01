IMGKit.configure do |config|


  config.wkhtmltoimage = Rails.root.join('bin', 'wkhtmltoimage-amd64').to_s if ENV['RACK_ENV'] == 'production'
  config.wkhtmltoimage = Rails.root.join('bin', 'wkhtmltoimage-i386').to_s

  side_size = 600
  crop_side_size = 600

  config.default_options = { :quality => 90, :width   => side_size,
						                      :height  => side_size,
						                      "crop-w" => crop_side_size,
						                      "crop-h" => crop_side_size,
						                      "disable-smart-width" => true,
						                      "zoom" => 0.5}

end

