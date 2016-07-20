FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@example.com"
    end

    password "123456"
    about_me "I like horses"
    sign_in_count 5
  end
end
