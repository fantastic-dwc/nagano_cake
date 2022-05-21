class Admin::OrdersController < ApplicationController
  
  def show
    @order = Oder.find(params[:id])
    @order_producs = @order.order_producs
  end
  
  def update
    
  end
end
