FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@example.com"
    end
    id 1
    about_me "My name is James Brown"
    password "123456"
  end
end
