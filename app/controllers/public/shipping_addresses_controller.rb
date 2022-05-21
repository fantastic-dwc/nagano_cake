class Public::ShippingAddressesController < ApplicationController

  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = ShippingAddress.all
  end

  def edit
     @shipping_address = ShippingAddress.find(params[:id])
  end

  def create
    @shipping_addresses = ShippingAddress.all
    @shipping_address = ShippingAddress.new(shipping_address_params)
    if @shipping_address.save
      redirect_to shipping_addresses_path, notice: "配送先住所を新規登録しました"
    else
      @shipping_addresses = ShippingAddress.all
    end
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      redirect_to shipping_addresses_path, notice: "配送先住所を編集しました"
    else
      render "edit"
    end
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.destroy
      redirect_to shipping_addresses_path, notice: "配送先住所を削除しました"
    end
  end

  private
  def shipping_address_params
    params.require(:shipping_address).permit(:postcode, :address, :name)
  end

end
