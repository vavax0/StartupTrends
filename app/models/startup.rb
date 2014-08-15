class Startup < ActiveRecord::Base

	before_validation do
		slug_make
	end

	belongs_to :category

	scope :published, -> { where(visible: true) }

	has_attached_file :website_thumbnail, :storage => :dropbox, 
					  :styles => { :big => "800x500", :medium => "400x300", :thumb => "250x200" },
					  :dropbox_credentials => "#{Rails.root}/config/dropbox.yml", 
					  :dropbox_options => { :path => proc { |style| "#{style}/#{id}_#{website_thumbnail.original_filename}.jpg" } }

	validates_attachment_content_type :website_thumbnail, 
                                    :content_type => /^image\/(png|gif|jpeg)/
										


	validates :name, :description, :category_id, :slug, presence: true
	validates :short_description, length: { maximum: 70 }
	validates :website_url, presence: true, url: true
	validates :email, presence: true


	def to_param  # overridden
    	slug
  	end

  	def slug_make
  		self.slug = self.name.downcase.gsub(" ", "-").gsub(".", "-")
  	end

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