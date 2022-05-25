class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

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
