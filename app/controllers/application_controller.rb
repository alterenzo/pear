class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if current_user && (current_user.sign_in_count == 1 || current_user.about_me.blank?)
      new_profile_path
    else
      request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    end
  end
end
