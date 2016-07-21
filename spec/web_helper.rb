def add_tag(tag)
  fill_in "Tags", with: tag
  click_button "Add"
end

def set_github_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({ "provider" => "github", "uid" => "65", "info" => {"email" => "user1@user1.com"} })
end

def set_github_omniauth_invalid
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = :invalid_crendentials
end

def click_github_sign_in
  within "#landing" do
    click_link "Sign in with GitHub"
  end
end

def sign_in_and_create_profile
  visit root_path
  set_github_omniauth
  click_github_sign_in
  

  fill_in "Tell us a bit about yourself", with: "I am awesome!"
  fill_in "What skills do you have?", with: "ruby,javascript"
  fill_in "What are you working on?", with: "death star soft"
  fill_in "Link to your project's GitHub repository",
    with: "http://www.github.com/death_star"
  click_button "Create"
end
