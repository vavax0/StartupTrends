require 'rails_helper'

describe Startup do

	let(:startup)  { FactoryGirl.create(:startup) }
	let(:category) { FactoryGirl.create(:category, id: 3) }

	it 'has name, description and website_url' do
		expect(startup).to be_valid
	end

	it 'is not valid without name' do
		startup.name = nil
		expect(startup).to_not be_valid
	end

	it 'is not valid without description' do
		startup.description = nil
		expect(startup).to_not be_valid
	end

	it 'is not valid without website_url' do
		startup.website_url = nil
		expect(startup).to_not be_valid
	end

	it 'should not have too long "short describtion"' do
		startup.short_description = 'a'*51
		expect(startup).to_not be_valid
	end

	it "should have website_url that is valid and exists" do
		startup.website_url = "nothing"
		expect(startup).to_not be_valid
	end

	it "should be associated with category" do
		expect(startup).to respond_to(:category)
	end

	it 'should be invalid without category name' do
		startup.category = nil
		expect(startup).to_not be_valid
	end
end
