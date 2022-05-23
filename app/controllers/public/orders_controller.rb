class Public::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order = Order.new

  end

  def create
    # binding.pry
    cart_products = current_customer.cart_products.all
    @order = Order.new(order_params)
    if @order.save
      cart_products.each do |cart|
        order_product = OrderProduct.new
        order_product.product_id = cart.product_id
        order_product.order_id = @order.id
        order_product.quantity = cart.quantity
        order_product.price = cart.product.price
        order_product.save
      end
      redirect_to complete_path
      cart_products.destroy_all
    else
      @order = Order.new(order_params)
      render 'new'
    end
  end

  def confirm
    @order = Order.new(order_params)
    @cart_products = current_customer.cart_products.all
    # order_products.allではなくcart_products.allかもしれない。実際に動かして確認。
    @total_price =  @cart_products.inject(0) { |sum, product| sum + product.subtotal }
    # @cart_products.subtotal + @fee
    @fee = 800
    @order.shipping_fee = @fee
    if params[:order][:select_address] == "0"
      @order.name = current_customer.first_name + current_customer.last_name
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
    elsif params[:order][:select_address] == "1"
      unless ShippingAddress.exists?(name: params[:order][:address_id])
        # name??
        @order.name = ShippingAddress.find(params[:order][:address_id]).name
        @order.postcode = ShippingAddress.find(params[:order][:address_id]).postcode
        @order.address = ShippingAddress.find(params[:order][:address_id]).address
      else
        render 'new'
      end
    elsif params[:order][:select_address] == "2"
      # shippingaddressを作って機能するか確認する"1"のセレクタも確認
    else
      render 'new'
    end
    # binding.pry
    # 検証ツール
  end

  def complete
  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :postcode, :address, :name, :total_price, :shipping_fee)
  end

end
