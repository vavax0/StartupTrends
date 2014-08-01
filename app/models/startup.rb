class Startup < ActiveRecord::Base

	has_attached_file :website_thumbnail, :storage => :dropbox, 
					  :styles => { :big => "600x600", :medium => "450x450", :thumb => "300x300" },
					  :dropbox_credentials => "#{Rails.root}/config/dropbox.yml", 
					  :dropbox_options => { :path => proc { |style| "#{style}/#{id}_#{website_thumbnail.original_filename}.jpg" } }
										
	validates_attachment_content_type :website_thumbnail, :content_type => /\Aimage/
	validates :website_thumbnail, attachment_presence: true

	validates :name, :description, presence: true
	validates :short_description, length: { maximum: 50 }
	validates :website_url, presence: true, url: true


	def smart_add_url_protocol
  		unless self.website_url[/\Ahttp:\/\//] || self.website_url[/\Ahttps:\/\//]
    		self.website_url = "http://#{self.website_url}"
  		end
	end


end