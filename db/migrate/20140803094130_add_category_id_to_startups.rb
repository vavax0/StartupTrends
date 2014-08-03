class AddCategoryIdToStartups < ActiveRecord::Migration
  def change
    add_column :startups, :category_id, :integer
  end
end
