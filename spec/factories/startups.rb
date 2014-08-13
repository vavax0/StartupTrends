image = File.new("#{Rails.root}/tmp/image.jpg")

FactoryGirl.define do
	factory :startup do
		name 'Test Startup Name'
		description 'BenchMail helps you improve your e-mail marketing by focusing on people "behind" the e-mail addresses. It provides metrics to uncover their behavior and preferences and identify the most'
		image_url 'http://www.google.pl/khjr.jpg'
		website_url 'http://www.google.pl'
		website_thumbnail image
		visible true
		category_id 1
		views 0
		email 'xxxx@xxx.xx'
		created_at Time.now
	end
end