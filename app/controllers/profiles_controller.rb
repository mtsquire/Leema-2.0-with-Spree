class ProfilesController < ApplicationController
  layout "profiles"
  def show
    @user = User.find_by_permalink(params[:id])
    @supplier = @user.supplier

    if @user
      render action: :show
    else
      puts "User was not found"
      render file: 'public/404', status: 404, format: [:html]
    end

  end

end
