require 'rails_helper'

RSpec.describe StartupsController, :type => :controller do

	describe "GET show" do

		let(:startup) { FactoryGirl.create(:startup) }

		before do
			get :show, id: startup.id
		end

		it 'exposes startups' do
			expect(controller.index).to include startup
		end 

		it 'should expose specific startup' do
			expect(assigns(:startup)).to eq startup
		end

		it 'increases views count by one' do
			expect{ 
					get :show , id: startup.id
				}.to change{startup.views}.by(1)
		end

		xit "should exposes startup's region" do
			expect(assigns(:startup).regions).to eq region
		end

	end

	describe "POST create" do

		let(:valid_attributes) { { :name => "lol", :description => "lol", :short_description => "lol", :website_url => "google.pl", :category_id => 3 } } 

		subject { post :create, { :startup => valid_attributes } }
		
		it 'creates a new Startup' do
			expect {
				post :create, { :startup => valid_attributes } 
			}.to change(Startup, :count).by(1)
		end

		it 'should redirect to created startup' do
			post :create, { :startup => valid_attributes } 
			expect(response).to redirect_to Startup.last
		end

		it 'flashes a success message' do 
			expect(subject.request.flash[:success]).to_not be_nil
		end


		it 'flashes a error messages' do
			valid_attributes[:website_url] = " lol "
			expect(subject.request.flash[:error]).to_not be_nil
		end

		it 'should add "http" protocol if needed' do
			post :create, { :startup => valid_attributes }
			expect(Startup.last.website_url).to eq "http://google.pl"
		end


	end

end
