FactoryGirl.define do
  factory :tag do
    sequence :name do |n|
      "ruby#{n}"
    end
  end
end