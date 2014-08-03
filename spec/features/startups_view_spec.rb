require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe "The Startup view", type: :feature do

	describe "Index" do

		
		startup_1 = FactoryGirl.create(:startup)
		startup_2 = FactoryGirl.create(:startup, name: '2nd Name')
		startup_3 = FactoryGirl.create(:startup, name: '3rd Name')

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