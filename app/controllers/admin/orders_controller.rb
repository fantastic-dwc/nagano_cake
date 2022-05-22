class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    @subtotal = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    # @order_products = @order.order_products
    # @product.update
    flash[:notice] = "更新完了しました"
    redirect_to request.referer
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
