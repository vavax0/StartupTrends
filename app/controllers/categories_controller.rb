class CategoriesController < ApplicationController

	before_action :categories_all, only: [ :show, :index ]

	def index
		@startups = Startup.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
	end

	def show
		@category = Category.find(params[:id])
		@startups = @category.startups.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
	end

	private

		def categories_all
			@categories = Category.all
		end

end