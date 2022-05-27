class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @new_products = params[:name].present? ? Genre.find(params[:name]).products.where(is_active: true) : Product.where(is_active: true).limit(4).order(Arel.sql(" created_at DESC "))
  end

  def about
  end
end
