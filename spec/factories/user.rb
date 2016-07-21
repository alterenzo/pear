FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@example.com"
    end

    about_me "My hobbies are drinking milk and riding tractors"
    current_project "Horse tinder"
    github_repo "http://ilovehorses.com"
    password "123456"
    sign_in_count 5
    name "James Brown"
    photo "https://avatars0.githubusercontent.com/u/17764313?v=3&s=460"
  end
end
