class ProfilesController < ApplicationController

  def index
    @profile = User.offset(rand(User.count)).first
  end

  def new
    @user = User.find(current_user.id)
  end

  def create
    @user = User.find(current_user.id)
    @user.update(user_params)
    redirect_to profile_path(@user)
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: { user: @user, tags: @user.tag_list}}
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to profiles_path
  end

  private

  def user_params
    params.require(:user).permit(:tag_list, :about_me, :current_project, :github_repo)
  end

end


# $.each([ 52, 97 ], function( index, value ) {
#   alert( index + ": " + value );
# });
