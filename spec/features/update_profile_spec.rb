require "rails_helper"

feature "update profile" do
  scenario "the user can edit their profile" do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit root_path
    click_link("Edit Profile")
    fill_in("What skills do you have?", with: "C++, Python")
    fill_in("What are you working on?", with: "a new lightsaber")
    fill_in("Tell us a bit about yourself", with: "I'm a jedi")
    click_button("Update Profile")
    visit profile_path(user)
    expect(page).to have_content("C++")
    expect(page).to have_content("a new lightsaber")
    expect(page).to have_content("I'm a jedi")
  end

end
