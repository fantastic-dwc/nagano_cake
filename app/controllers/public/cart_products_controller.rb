class Public::CartProductsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_products = current_customer.cart_products
    @total_price = @cart_products.inject(0) { |sum, product| sum + product.subtotal }
    @order = Order.new
  end

  def create
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

end
