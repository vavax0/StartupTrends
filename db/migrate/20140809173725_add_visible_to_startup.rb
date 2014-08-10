class AddVisibleToStartup < ActiveRecord::Migration
  def change
    add_column :startups, :visible, :boolean, :default => false
  end
end
