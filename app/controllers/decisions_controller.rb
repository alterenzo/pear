class DecisionsController < ApplicationController

  def create
    p params
    current_user.decisions.first_or_create(on_user: params[:on], liked: no_or_yes)
    fetch_user
  end

  private

  def fetch_user
    @profile = User.offset(rand(User.count)).first
    @tags = @profile.tag_list
    render json: @profile
  end

  def no_or_yes
    choices = {
      left: false,
      right: true
    }
    choices[params[:decision].to_sym]
  end
end
