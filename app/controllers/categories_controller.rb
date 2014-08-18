class CategoriesController < ApplicationController

	before_action :categories_all, only: [ :show, :index ]

	def index
		@startups = Startup.published.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
	end

	def show
		@category = Category.find(params[:id])
		@startups = @category.startups.published.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
	end

	private

		def categories_all
			@categories = Category.all.order("name DESC")
		end

end