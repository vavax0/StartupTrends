
FactoryGirl.define do
	factory :startup do
		name 'Test Startup Name'
		description 'BenchMail helps you improve your e-mail marketing by focusing on people "behind" the e-mail addresses. It provides metrics to uncover their behavior and preferences and identify the most'
		image_url 'http://www.google.pl/khjr.jpg'
		website_url 'http://www.google.pl'
		created_at Time.now
	end
end