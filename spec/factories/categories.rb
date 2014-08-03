# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
  	id 3
    name 'Category Name'
    created_at Time.now
  end
end
