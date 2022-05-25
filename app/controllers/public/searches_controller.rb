class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    @products = Product.looks(params[:search], params[:word])
  end
end
