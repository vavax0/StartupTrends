class TagsController < ApplicationController
  def index
  	@tags = Tag.all
  end

  def show
  	@tag = Tag.find(params[:id])
  	@startups = @tag.startups.published.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
  end
end
