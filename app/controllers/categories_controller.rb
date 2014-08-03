class CategoriesController < ApplicationController

	before_action :set_category, only: [ :show, :edit, :update, :destroy ]

	def index
		@categories = Category.all
		@startups = Startup.all
	end

	def show
		@startups = @category.startups
	end

	private

		def set_category 
			@category = Category.find(params[:id])
		end

end