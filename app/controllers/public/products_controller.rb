class Public::ProductsController < ApplicationController
  def index
    @genres = Genre.all
    @products = params[:name].present? ? Genre.find(params[:name]).products : Product.where(is_active: true)
  end

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
    #@cart_product.customer_id = current_user.id
    #@cart_product.product_id = @product.id
  end
end
