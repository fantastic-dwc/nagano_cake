class Admin::OrderProductsController < ApplicationController

  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update(order_product_params)
    if @order_product.production_status == "manufacturing"
      @order_product.order.update(order_status: "making")
    end
    order = @order_product.order
    if order.order_products.where(production_status: "finish").count == order.order_products.count
      order.update(order_status: "preparing")
    end
    redirect_to request.referer
    flash[:notice] = "更新完了しました"
  end

  private

  def order_product_params
    params.require(:order_product).permit(:production_status)
  end

end
