class AddShortDesctiptionToStartups < ActiveRecord::Migration
  def change
    add_column :startups, :short_description, :string
  end
end
