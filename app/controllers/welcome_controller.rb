class WelcomeController < ApplicationController
	layout "home"
  def index
    @products = Product.all
  end
end
