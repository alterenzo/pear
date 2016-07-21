require "rails_helper"

feature "sign in" do

  context "when user signed in" do
    scenario "user can see profiles" do
      user = FactoryGirl.create(:user)
      login_as(user)
      visit root_path
      expect(page).to have_button("Yes")
    end
  end

  context "when user not signed in" do
    scenario "user cannot see profiles" do
      visit root_path
      expect(page).to have_content("Swipe to find your perfect pair")
      expect(page).not_to have_button("Yes")
    end
  end

end
