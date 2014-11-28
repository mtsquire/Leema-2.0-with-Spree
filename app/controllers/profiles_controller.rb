class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:id])
    if @user
      render action: :show
      @comments = @user.comments.all
    else
      render file: 'public/404', status: 404, format: [:html]
    end
  end

end
