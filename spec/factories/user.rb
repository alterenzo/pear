FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@example.com"
    end
    provider 'github'
    sequence(:uid) { |n| "#{n}"}
    id 1
    about_me "My name is James Brown"
    current_project "Horse tinder"
    github_repo "http://ilovehorses.com"
    password "123456"
    sign_in_count 5
  end
end
