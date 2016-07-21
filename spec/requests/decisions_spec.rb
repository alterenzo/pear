require 'rails_helper'

describe DecisionsController, type: :request do

  describe "#create" do
    it "returns JSON data when a post request is sent" do
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user)

      post decisions_path, params: { "decision" => "left", format: :json }

      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:success)
      expect(response.body).to include_json(id: user.id,
                                            email: user.email,
                                            name: user.name,
                                            about_me: user.about_me,
                                            current_project: user.current_project,
                                            github_repo: user.github_repo,
                                            photo: user.photo)
    end

    it "returns an error if the user isn't logged in" do
      user = FactoryGirl.create(:user)

      post decisions_path, params: { "decision" => "left", format: :json }

      expect(response.content_type).to eq("application/json")
      assert_response(401)
      expect(response.body).to include_json(error: "You need to sign in or sign up before continuing.")
    end
  end

end
