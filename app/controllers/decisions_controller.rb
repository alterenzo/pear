class DecisionsController < ApplicationController

  def create
    p params
    @profile = User.offset(rand(User.count)).first
    render json: @profile
  end
end
