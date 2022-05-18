class Public::CustomersController < ApplicationController
  def show
    @customers = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end
end
