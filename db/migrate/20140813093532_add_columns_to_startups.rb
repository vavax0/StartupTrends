class AddColumnsToStartups < ActiveRecord::Migration
  def change
  	add_column :startups, :activation_token, :string
  	add_column :startups, :email_active, :boolean, :default => false
  end
end
