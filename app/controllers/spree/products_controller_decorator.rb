# Spree::ProductsController.class_eval do
#   def new
#     super
#     @products = current_user.products.new
#   end

#   def create
#     super
#     @products = current_user.products(permit_attributes)
#   end
# end