class ProfilesController < ApplicationController

  def index
  end

  def new
    @user = User.find(id: current_user.id)
  end

end
