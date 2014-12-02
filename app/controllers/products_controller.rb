class ProductsController < Spree::ProductsController
    layout "products"
  def show
    @user = User.find(params[:id])
  end

    private
      def product_params
        params.require(:product).permit(:user_id, :title, :price, :description, :photo)
      end

  end