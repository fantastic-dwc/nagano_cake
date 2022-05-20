class Public::CartProductsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_products = current_customer.cart_products
    @total_price = @cart_products.inject(0) { |sum, product| sum + product.subtotal }
    @order = Order.new
  end

  def create
    @product = Product.find(params[:cart_product][:product_id])
    if current_customer.cart_products.find_by(product_id: @product.id).present?
      @cart_product = current_customer.cart_products.find_by(product_id: @product.id)
      @new_cart_product = CartProduct.new(cart_product_params)
      @cart_product.quantity += @new_cart_product.quantity
      @cart_product.save
      flash[:notice] = "カートに商品が追加されました"
      redirect_to cart_products_path
    else
      @cart_product = CartProduct.new(cart_product_params)
      @cart_product.customer_id = current_customer.id
      if @cart_product.save
        flash[:notice] = "カートに商品が追加されました"
        redirect_to cart_products_path
      else
        @cart_products = CartProduct.all
        flash[:notice] = "商品の個数を選択してください"
        render 'public/products/show'
      end
    end
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    if @cart_product.update(cart_product_params)
      flash[:notice] = "商品の数量が更新されました"
      redirect_to request.referer
    else
      render "index"
    end
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    if @cart_product.destroy
      flash[:notice] = "カート内の商品を削除しました"
      redirect_to request.referer
    end
  end

  def destroy_all
    current_customer.cart_products.destroy_all
    flash[:notice] = "カートの商品が全て削除されました"
    redirect_to request.referer
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:product_id, :quantity, :customer_id)
  end

end
