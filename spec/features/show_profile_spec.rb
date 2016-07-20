require "rails_helper"

feature "profiles" do

  context "viewing other peoples profiles" do
    scenario "should display users profile details" do
      user = FactoryGirl.create(:user)
      login_as(user)
      visit profile_path(user)
      expect(page).to have_content("My name is James Brown")
    end
  end

  context "viewing my own profile" do
    scenario "clicking on email should display my profile" do
      user = FactoryGirl.create(:user)
      login_as(user)
      visit root_path
      click_link user.email
      expect(current_path).to eq profile_path(user)
    end
  end

end
