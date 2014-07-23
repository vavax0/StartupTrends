class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.string :website_url

      t.timestamps
    end
  end
end
