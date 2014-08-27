class TagsController < ApplicationController
  def index
  	@tag_all = Startup.published.map { |startup| startup.tags }
  	@tags = @tag_all[0]
  end

  def show
  	@tag = Tag.find(params[:id])
  	@startups = @tag.startups.published.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
  end
end
