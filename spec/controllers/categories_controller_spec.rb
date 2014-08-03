require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

RSpec.describe CategoriesController, :type => :controller do

	let(:category) { FactoryGirl.create(:category) }

	describe "GET index" do

		it 'populates array of categories' do
			get :index
			expect(assigns(:categories)).to eq([category])
		end

		it 'should render index template' do
			get :index
			expect(response).to render_template :index
		end

	end

	describe "GET show" do

		before(:each) do
			get :show, id: category.id
		end

		it 'shows choosen category startups' do
			expect(assigns(:startups)).to eq(category.startups)
		end

	end

end
