class ProfilesController < ApplicationController

  def index
  end

  def new
    @user = User.find(current_user.id)
  end

  def create
    @user = User.find(current_user.id)
    @user.update(user_params)
    redirect_to profiles_path
  end

  private

  def user_params
    params.require(:user).permit(:tags, :about_me, :current_project, :github_repo)
  end

end
