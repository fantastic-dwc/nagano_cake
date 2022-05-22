class Admin::HomesController < ApplicationController
  def top
    @order_producs = OrderProduct.all
    @orders = Order.page(params[:page])
  end
end
