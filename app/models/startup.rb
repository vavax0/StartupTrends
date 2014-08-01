class Startup < ActiveRecord::Base

	has_attached_file :website_thumbnail, :storage => :dropbox, :dropbox_credentials => "#{Rails.root}/config/dropbox.yml", 
					  :dropbox_options => { :path => proc { |style| "#{style}/#{id}_#{website_thumbnail.original_filename}.png" } }
										
	validates_attachment_content_type :website_thumbnail, :content_type => /\Aimage/

	validates :name, :description, :website_url, presence: true
	validates :short_description, length: { maximum: 50 }
	validates :website_url, presence: true, url: true
	before_validation :smart_add_url_protocol
	

	def smart_add_url_protocol
  		unless self.website_url[/\Ahttp:\/\//] || self.website_url[/\Ahttps:\/\//]
    		self.website_url = "http://#{self.website_url}"
  		end
	end


end