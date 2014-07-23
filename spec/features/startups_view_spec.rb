require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe "The Startup view", type: :feature do

	describe "Index" do

		
		startup_1 = FactoryGirl.create(:startup)
		startup_2 = FactoryGirl.create(:startup, name: '2nd Name')
		startup_3 = FactoryGirl.create(:startup, name: '3rd Name')


		it "shows each startup's name" do
			visit startups_path
				Startup.all.each do |strtup|
					expect(page).to have_content(strtup.name)
				end
		end

	end
end