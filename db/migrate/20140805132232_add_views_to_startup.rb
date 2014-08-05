class AddViewsToStartup < ActiveRecord::Migration
  def change

  	add_column :startups, :views, :integer, :default => "0"

  end
end
