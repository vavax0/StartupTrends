require 'rails_helper'

RSpec.describe Category, :type => :model do

	let(:startup)  { FactoryGirl.create(:startup) }
	let(:category) { FactoryGirl.create(:category) }
  
	it 'has name' do
		category.name = nil
		expect(category).to_not be_valid
	end
	
	it 'is associated with startup' do
		expect(category.startups).to include startup
	end

end
