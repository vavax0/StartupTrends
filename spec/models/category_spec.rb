require 'rails_helper'

RSpec.describe Category, :type => :model do

	let(:category) { FactoryGirl.create(:category) }
	let(:startup)  { FactoryGirl.create(:startup, category_id: category.id) }
	
	it 'has name' do
		category.name = nil
		expect(category).to_not be_valid
	end
	
	it 'is associated with startup' do
		expect(category.startups).to include startup
	end

end
