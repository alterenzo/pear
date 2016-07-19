class ProfilesController < ApplicationController

  def new
    @user = User.find(id: current_user.id)
  end


end
