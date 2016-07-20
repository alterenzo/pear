class DecisionsController < ApplicationController

  def create
    puts params
    @profile = User.offset(rand(User.count)).first
    render json: @profile
  end
end
