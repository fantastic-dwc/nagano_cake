class Admin::OrdersController < ApplicationController

  def show
    @order = Oder.find(params[:id])
    @order_producs = @order.order_producs
  end

  def update
    @order = Order.find(params[:id])
    @product.update(order_params)
    @order_producs = @order.order_producs
    @product.update
    redirect_to request.referer
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
