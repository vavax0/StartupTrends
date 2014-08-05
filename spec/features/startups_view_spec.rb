require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe "The Startup view", type: :feature do

	describe "Index" do

			image = File.new("#{Rails.root}/tmp/image.jpg")
			category_1 = FactoryGirl.create(:category)
			startup_1 = FactoryGirl.create(:startup, category_id: category_1.id)

		before(:each) do
			visit startups_path
		end

		it "shows each startup's name" do
			Startup.all.each do |startup|
				expect(page).to have_content(startup.name)
			end
		end

		it 'has link to categories' do
			expect(page).to have_link('Kategorie', categories_path)
		end

	end
end