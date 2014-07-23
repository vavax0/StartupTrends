class Startup < ActiveRecord::Base

	validates :name, :description, :website_url, presence: true
	validates :short_description, length: { maximum: 50 }

	before_validation :smart_add_url_protocol

	has_attached_file :website_thumbnail, :storage => :dropbox, :dropbox_credentials => "#{Rails.root}/config/dropbox.yml", 
					  :dropbox_options => { :path => proc { |style| "#{style}/#{id}_#{website_thumbnail.original_filename}.jpg" } }
										
	validates_attachment_content_type :website_thumbnail, :content_type => /\Aimage/

	private

		def smart_add_url_protocol
  			unless self.website_url[/\Ahttp:\/\//] || self.website_url[/\Ahttps:\/\//]
    			self.website_url = "http://#{self.website_url}"
  			end
		end
end