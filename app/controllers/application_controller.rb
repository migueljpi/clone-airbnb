class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :store_action

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[first_name last_name age language guide about_me photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[language guide about_me photo])
  end

  def store_action
    return unless request.get?

    if request.path != "/users/sign_in" &&
       request.path != "/users/sign_up" &&
       request.path != "/users/password/new" &&
       request.path != "/users/password/edit" &&
       request.path != "/users/confirmation" &&
       request.path != "/users/sign_out" &&
       !request.xhr? # don't store ajax calls
      store_location_for(:user, request.fullpath)
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope)
  end
end
