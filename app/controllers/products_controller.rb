class ProductsController < ApplicationController
    layout "products"
    before_action :authenticate_user!

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

    def show
      @product = Product.find(params[:id])
      @user = @product.user
    end

    def index
      @products = Product.all
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

    def update
      @product = Product.find(params[:id])
      if params[:product] && params[:product].has_key?(:user_id)
        params[:product].delete(:user_id) 
      end
      respond_to do |format|
        if @product.update_attributes(product_params)
          format.html { redirect_to @product, notice: 'Product was successfully updated.' }
          format.json { render :index, product: :ok, location: @product }
        else
          format.html { render :edit }
          format.json { render json: @product.errors, product: :unprocessable_entity }
        end
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
