require 'rails_helper'

RSpec.describe StartupsController, :type => :controller do

	describe "GET show" do

		let(:startup) { FactoryGirl.create(:startup) }

		before do
			get :show, id: startup.id
		end

		it 'exposes posts' do
			expect(controller.index).to include startup
		end 

		it 'should expose specific post' do
			expect(assigns(:startup)).to eq startup
		end


		xit "should exposes startup's region" do
			expect(assigns(:startup).regions).to eq region
		end

	end

	describe "POST create" do

		let(:valid_attributes) { { :name => "lol", :description => "lol", :short_description => "lol", :website_url => "google.pl" } }
		
		it 'creates a new Startup' do
			expect {
				post :create, { :startup => valid_attributes } 
			}.to change(Startup, :count).by(1)
		end


		it 'should redirect to created startup' do
			post :create, { :startup => valid_attributes } 
			expect(response).to redirect_to Startup.last
		end

		it 'should destroy startup if website_url is not available' do
			
		end
	end

end
