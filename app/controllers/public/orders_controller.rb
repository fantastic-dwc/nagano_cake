class Public::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order = Order.new

  end

  def create
  end

  def confirm
    @order = Order.new(order_params)
    @order_products = current_customer.order_products.all
    @total_price = 0
    @fee = 800
    # @order
    if params[:order][:select_address] == "0"
      @order.name = current_customer.first_name + current_customer.last_name
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
    elsif params[:order][:select_address] == "1"
      if ShippingAddress.exists?(name: paramas[:order][:address_id])
        # name??
        @order.name = ShippingAddress.find(paramas[:order][:address_id]).name
        @order.postcode = ShippingAddress.find(paramas[:order][:address_id]).postcode
        @order.address = ShippingAddress.find(paramas[:order][:address_id]).address
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
    params.require(:order).permit(:payment_method, :postcode, :address, :name)
  end

end
