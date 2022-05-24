class Admin::OrderProductsController < ApplicationController
  
  def update
    @order_products = OrderProduct.find(params[:id])
    @order_products.update(order_product_params)
    redirect_to request.referer
    flash[:notice] = "更新完了しました"
  end
  
  private
  
  def order_product_params
    params.require(:order_product).permit(:production_status)
  end
  
end
