require 'rails_helper'

feature "New profile" do
  context "user has clicked github sign in" do
    scenario "user has not previously signed in with github" do
      visit root_path
      set_github_omniauth

      click_github_sign_in
      expect(current_path).to eq new_profile_path

      fill_in "Tell us a bit about yourself", with: "I am awesome!"
      fill_in "What skills do you have?", with: "ruby,javascript"
      fill_in "What are you working on?", with: "death star soft"
      fill_in "Link to your project's GitHub repository",
        with: "http://www.github.com/death_star"
      click_button "Create"

      user = User.find_by_uid_and_provider("65", "github")
      expect(current_path).to eq profile_path(user)
      expect(page).to have_content("I am awesome!")
    end
  end
end
