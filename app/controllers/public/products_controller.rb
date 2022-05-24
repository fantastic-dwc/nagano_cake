class Public::ProductsController < ApplicationController
  def index
    @genres = Genre.all
    @products = params[:name].present? ? Genre.find(params[:name]).products.all : Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
    @same_genre_products = Product.where(genre_id: @product.genre_id)
  end
end
