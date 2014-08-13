class Startup < ActiveRecord::Base

	belongs_to :category

	scope :published, -> { where(visible: true) }

	has_attached_file :website_thumbnail, :storage => :dropbox, 
					  :styles => { :big => "800x500", :medium => "400x300", :thumb => "250x200" },
					  :dropbox_credentials => "#{Rails.root}/config/dropbox.yml", 
					  :dropbox_options => { :path => proc { |style| "#{style}/#{id}_#{website_thumbnail.original_filename}.jpg" } }
										


	validates :name, :description, :category_id, presence: true
	validates :short_description, length: { maximum: 50 }
	validates :website_url, presence: true, url: true
	validates :email, presence: true


	def smart_add_url_protocol
  		unless self.website_url[/\Ahttp:\/\//] || self.website_url[/\Ahttps:\/\//]
    		self.website_url = "http://#{self.website_url}"
  		end
	end

	def send_activation_email
		generate_token(:activation_token)
		StartupMailer.activation_email(self).deliver
	end

	def generate_token(column)
		self[column] = SecureRandom.urlsafe_base64
		self.save
	end


end