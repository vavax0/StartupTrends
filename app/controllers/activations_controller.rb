class ActivationsController < ApplicationController

  def update
  	@startup = Startup.find_by_activation_token(params[:id])

  	@startup.email_active = true
  	@startup.save
  	flash[:success] = "Twójemail został zweryfikowany. Wkrótce opublikujemy Twój Startup."
  	redirect_to root_path
  end

end
