ActiveAdmin.register Startup do

    menu :priority => 1

    config.sort_order = "created_at"

    filter :category
    filter :views
    filter :visible
    filter :created_at

    index do

      column "Id" do |startup|
        link_to startup.id, admin_startup_path(startup)
      end

      column "Name" do |startup|
        link_to startup.name, admin_startup_path(startup)
      end

      column :short_description
      column :website_url
      column :views
      column :visible
      column :created_at

      column "Acceptance" do |startup|
        link_to "Accpet", accept_admin_startup_path(startup), :method => :put
      end

    end

    member_action :accept, :method => :put do
      @startup = Startup.find(params[:id])
      @startup.visible = true
      @startup.save
      redirect_to admin_startups_path, notice: 'Startup #{@startup} published!'
    end




  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end


end
