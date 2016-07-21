class DecisionsController < ApplicationController

  def create
    p params
    @profile = User.offset(rand(User.count)).first
    @tags = @profile.tag_list
    render json: @profile
  end
end
