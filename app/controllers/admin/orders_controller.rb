class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    @subtotal = 0
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      @order.order_products.update_all(production_status: 1) if @order.order_status == "waiting"
      @order.update_all(order_status: 2) if @order.order_products.production_status == "manufacturing"
      @order.update_all(order_params: 3) if @order.order_products.production_status == "finish"
    # @order_products = @order.order_products
    # @product.update
    flash[:notice] = "更新完了しました"
    redirect_to request.referer
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
