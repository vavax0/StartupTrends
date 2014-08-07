class CategoriesController < ApplicationController

	before_action :set_category, only: [ :show, :edit, :update, :destroy ]

	def index
		@categories = Category.all
		@startups = Startup.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
	end

	def show
		@startups = @category.startups.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
	end

	def create
	end

	def edit
	end

	private

		def set_category 
			@category = Category.find(params[:id])
		end

end