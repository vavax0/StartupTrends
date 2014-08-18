class Tag < ActiveRecord::Base

	has_many :taggings
	has_many :startups, through: :taggings

end
