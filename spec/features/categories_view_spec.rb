require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe "The Category view", type: :feature do

	describe "Index" do

		category_1 = FactoryGirl.create(:category)

		before(:each) do
			visit categories_path
		end

		it "shows each category name" do
			Category.all.each do |category|
					expect(page).to have_content(category.name)
			end
		end

		it 'has each category link' do
			Category.all.each do |category|
				expect(page).to have_link(category.name, category_path(category))
			end
		end

	end
end