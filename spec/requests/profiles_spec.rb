require 'rails_helper'

describe ProfilesController, type: :request do

  describe "#show" do
    it "returns JSON data when a get request is made" do
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user)

      get profile_path(user), params: { format: :json }

      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:success)
      expect(response.body).to include_json(user: {id: user.id,
                                            email: user.email,
                                            name: user.name,
                                            about_me: user.about_me,
                                            current_project: user.current_project,
                                            github_repo: user.github_repo,
                                            photo: user.photo},
                                            tags: user.tag_list)
    end

    it "returns an error if the user isn't logged in" do
      user = FactoryGirl.create(:user)

      get profile_path(user), params: { format: :json }

      expect(response.content_type).to eq("application/json")
      assert_response(401)
      expect(response.body).to include_json(error: "You need to sign in or sign up before continuing.")
    end
  end

end
