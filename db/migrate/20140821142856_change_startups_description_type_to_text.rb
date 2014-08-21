class ChangeStartupsDescriptionTypeToText < ActiveRecord::Migration
  def change
  	change_column :startups, :description, :text, :limit => nil
  end
end
