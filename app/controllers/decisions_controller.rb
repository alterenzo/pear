class DecisionsController < ApplicationController

  def create
    @profile = User.offset(rand(User.count)).first
    @tags = @profile.tag_list
    render json: @profile
  end
end
