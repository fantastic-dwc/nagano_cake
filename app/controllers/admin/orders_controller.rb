class Admin::OrdersController < ApplicationController
  
  def show
    @order = Oder.find(params[:id])
  end
  
  def update
    
  end
end
