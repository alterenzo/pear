require 'rails_helper'

feature "New profile" do
  context "user has clicked github sign in" do
    scenario "user has not previously signed in with github" do
      sign_in_and_create_profile
      user = User.find_by_uid_and_provider("65", "github")
      expect(current_path).to eq profile_path(user)
      expect(page).to have_content("I am awesome!")
    end

    scenario "user has previously signed in with our site using gthub" do
      sign_in_and_create_profile
      click_link('Logout')
      visit root_path
      set_github_omniauth
      click_github_sign_in
      user = User.find_by_uid_and_provider("65", "github")
      expect(current_path).to eq root_path
    end

    scenario 'user credentials do not authenticate' do
      visit root_path
      set_github_omniauth_invalid
      click_github_sign_in
      expect(current_path).to eq user_session_path
    end

    scenario 'a user who is not authenticated via github is told that they have invalid credentials' do
      visit root_path
      set_github_omniauth_invalid
      click_github_sign_in
      expect(page).to have_content('You need to sign in or sign up before continuing')
    end
  end
end
