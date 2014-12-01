Spree::ProductsController.class_eval do
  layout "products"
    before_action :authenticate_user!
    respond_to :html, :json

    def new
      @product = current_user.products.new
    end

    def create
      @product = current_user.products.new(product_params)

      respond_to do |format|
        if @product.save
          format.html { redirect_to @product, notice: 'Your product has been added.' }
          format.json { render :index, product: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, product: :unprocessable_entity }
        end
      end

    end

    def edit
      @product = Product.find(params[:id])
    end

    def update
      @product = Product.find(params[:id])
     
      if @product.update(product_params)
        redirect_to @product
      else
        render 'edit'
      end
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy

      redirect_to products_path
    end

    private
      def product_params
        params.require(:product).permit(:user_id, :title, :price, :description, :photo)
      end

end