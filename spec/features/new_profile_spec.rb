require 'rails_helper'

feature "New profile" do
  context "user has clicked github sign in" do
    scenario "user has not previously signed in with github" do
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user, :run_callbacks => false)
      visit new_profile_path
      fill_in "About me", with: "I am awesome!"
      fill_in "Tags", with: "ruby,javascript"
      fill_in "Current project", with: "death star soft"
      fill_in "Github repo", with: "http://www.github.com/death_star"
      click_button "Create"
      expect(current_path).to eq profiles_path
      p user.tags
    end
  end
end
