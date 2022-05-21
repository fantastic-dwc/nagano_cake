class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "会員情報の更新に成功しました！"
      redirect_to my_page_path
    else
      render :edit
    end
  end
  
  def unsubscribe
    @customer = current_customer
  end
  
  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理が完了いたしました。またのご利用をお待ちしております！"
    redirect_to root_path
  end

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:address,:tel,:is_deleted)
  end
end
