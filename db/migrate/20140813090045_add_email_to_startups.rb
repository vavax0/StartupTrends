class AddEmailToStartups < ActiveRecord::Migration
  def change
  	add_column :startups, :email, :string
  end
end
