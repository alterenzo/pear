require 'rails_helper'

feature "New profile" do
  context "user has clicked github sign in" do
    scenario "user has not previously signed in with github" do
      visit new_profile_path
      fill_in "about me", with: "I am awesome!"
      add_tag("ruby")
      add_tag("js")
      fill_in "what i am working on", with: "death star soft"
      fill_in "link to github repo", with: "http://www.github.com/death_star"
      click_button "create"
      expect(current_path).to eq profiles_path
    end
  end
end