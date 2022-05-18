class Public::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order_new = Order.new
    @customer = current_customer
  end

  def create
  end

  def confirm
  end

  def complete
  end
end
