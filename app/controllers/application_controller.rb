class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #added as part of SO answer with profile page editing
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end

  protected
    #Added so a user can edit their profile page.
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:date_of_birth, :about)
      end
      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:date_of_birth, :email, :city, :cover_photo, :state, :about, :password, :password_confirmation, :current_password, :store_name)
      end
    end

    def layout_by_resource
      if devise_controller? && action_name != "edit"
        "signin"
      else
        "interior"
      end
    end

end
