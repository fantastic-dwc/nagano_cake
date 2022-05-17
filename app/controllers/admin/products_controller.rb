class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])

  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product), notice: "商品の新規登録に成功しました"
    else
      render 'new'
    end
  end

  def update
    if @product.update(product_params)
      redirect_to admin_product_path(@product), notice: "商品の更新に成功しました"
    else
      render 'edit'
    end
  end


  private

  def product_params
    params.require(:product).permit(:name, :introduction, :genre_id, :product_image, :price, :is_active)
  end
end
