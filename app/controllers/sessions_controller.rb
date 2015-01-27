class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url :notice => "Signed in!"
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_url :notice => "Signed out!"
  end

  def after_sign_in_path_for(resource)
    return request.env['omniauth.origin'] || session[:user_return_to] || root_path
  end
end
