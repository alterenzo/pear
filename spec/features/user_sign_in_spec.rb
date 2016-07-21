require "rails_helper"

feature "sign in" do

  context "when user signed in" do
    scenario "user can see profiles" do
      user = FactoryGirl.create(:user)
      login_as(user)
      visit root_path
      expect(page).to have_button("Yes")
    end

     scenario 'can log out once logged in' do
       user = FactoryGirl.create(:user)
       login_as(user)
       visit root_path
       click_link 'Logout'
       expect(page).to have_content('You need to sign in or sign up before continuing.')
     end
   end

  context "when user not signed in" do

    scenario 'can sign in via dynamic navbar' do
      user = FactoryGirl.create(:user)
      login_as(user)
      visit root_path
      expect(page).to have_content('Find a Pear')
      expect(page).to_not have_content('Sign in')
   end

   scenario 'user cannot see all content within the dynamic navbar' do
     visit root_path
     expect(page).to_not have_content('Logout')
   end

    scenario "user cannot see profiles" do
      visit root_path
      expect(page).to have_content("Swipe to find your perfect pair")
      expect(page).not_to have_button("Yes")
    end

  end

end
