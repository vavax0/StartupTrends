require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe "The Category view", type: :feature do

	describe "Index" do

		
		startup_1 = FactoryGirl.create(:startup)
		startup_2 = FactoryGirl.create(:startup, name: '2nd Name')
		startup_3 = FactoryGirl.create(:startup, name: '3rd Name')

		before(:each) do
			visit startups_path
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