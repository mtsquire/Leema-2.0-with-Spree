class WelcomeController < ApplicationController
	layout "home"
  def index
    @products = Spree::Product.all
    @images = Spree::Image.all
    @users = User.all
  end
  
end
