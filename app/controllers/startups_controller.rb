class StartupsController < ApplicationController

	before_action :set_startup, only: [ :show, :edit, :update, :destroy ]

	def show
		@startup = Startup.all.find(params[:id])
	end

	def new
		@startup = Startup.new
	end

	def create

		@startup = Startup.new(startup_params)

		if @startup.save
			if create_website_thumbnail(@startup)
				redirect_to @startup
			else
				@startup.destroy
				render action: :new
			end
		else
			render action: :new
		end
	end

	def index
		@startups = Startup.all.paginate(:page => params[:page], :per_page => 5)
	end

	private

	def set_startup
		@startup = Startup.all.find(params[:id])
	end

	def startup_params
		params.require(:startup).permit(:name, :description, :short_description, :website_url)
	end

	def create_website_thumbnail(startup)
		kit = IMGKit.new(startup.website_url)
		img = kit.to_img(:jpg)
		file = Tempfile.new(["thumbnail_#{startup.name}_#{startup.id}", 'jpg'], 'tmp', :encoding => 'ascii-8bit')
		file.write(img)
		file.flush
		startup.website_thumbnail = file
		startup.save
		file.unlink
	end

end