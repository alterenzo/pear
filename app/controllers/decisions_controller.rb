class DecisionsController < ApplicationController

  def create
    @profile = User.offset(rand(User.count)).first
    render json: @profile
  end
end
