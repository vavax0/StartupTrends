class RemoveStartupIdFromStartups < ActiveRecord::Migration
  def change
  	remove_column :categories, :startup_id
  end
end
