require "rails_helper"

feature "the user can add skills" do
  scenario "when checking user profile after adding skills" do
    visit root_path
    set_github_omniauth
    click_github_sign_in
    expect(current_path).to eq new_profile_path

    fill_in "What skills do you have?", with: "ruby,javascript"
    click_button "Create"

    user = User.find_by_uid_and_provider("65", "github")
    expect(current_path).to eq profile_path(user)
    expect(page).to have_content("javascript")
  end
end