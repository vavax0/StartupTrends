
FactoryGirl.define do
	factory :startup do
		name 'Test Startup Name'
		description 'BenchMail helps you improve your e-mail marketing by focusing on people "behind" the e-mail addresses. It provides metrics to uncover their behavior and preferences and identify the most'
		image_url 'http://www.google.pl/khjr.jpg'
		website_url 'http://www.google.pl'
		website_thumbnail_file_name "thumbnail_hfg20140801-2616-13o36tejpg" 
		website_thumbnail_content_type "image/jpeg" 
		website_thumbnail_file_size 61848 
		website_thumbnail_updated_at "2014-08-01 07:32:13"
		category_id 3
		created_at Time.now
	end
end