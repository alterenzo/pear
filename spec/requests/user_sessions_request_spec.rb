require 'rails_helper'

describe Users::OmniauthCallbacksController, type: :request do


 describe "GET users/auth/github" do

   before do
     Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
     Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
  end

   it "testing omniauth hash" do
        get "/users/auth/github"
        request.env["omniauth.auth"][:uid].should == '65'
    end

    it 'should create user, redirect to homepage, and create session' do
      get "/users/auth/github"
      expect(response).to redirect_to(user_github_omniauth_callback_path)
    end
  end
end
