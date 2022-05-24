class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    @subtotal = 0
  end

  def update
    @order = Order.find(params[:id])
      @order.update(order_params)
     if @order.order_products.update_all(production_status: 1)
        @order.order_status == "waiting"
     elsif @order.order_products.update_all(production_status: 2)
       @order.order_status == "making"
     else @order.update_all(order_params: 3)
       @order.order_products.production_status == "finish"
     end
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
