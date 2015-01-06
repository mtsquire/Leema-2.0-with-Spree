Spree::ProductsController.class_eval do
  def index
    @products = Spree::Product.search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end

    session[:return_to] = request.url
    respond_with(@collection)
    
  end

end