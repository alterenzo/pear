require 'rails_helper'

describe DecisionsController, type: :request do

  describe "#create" do
    describe "dealing with post requests for liking and disliking" do
      it "submits a dislike to the database for a left swipe" do
        user = FactoryGirl.create(:user)
        login_as(user, scope: :user)
        user2 = FactoryGirl.create(:user)

        create_decision(user: user2.id)

        expect(Decision.first.liked).to eq false
      end

      it "submits a like to the database for a right swipe" do
        user = FactoryGirl.create(:user)
        login_as(user, scope: :user)
        user2 = FactoryGirl.create(:user)

        create_decision(direction: "right", user: user2.id)

        expect(Decision.first.liked).to eq true
      end
    end

    it "returns JSON data when a post request is sent" do
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user)

      create_decision(user: user)

      expect(Decision.all.count).to eq 1
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
