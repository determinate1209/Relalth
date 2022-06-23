class Public::CustomersController < ApplicationController
  before_action :move_to_signed_in, only: [ :show, :edit]
  
  
  
  def show
    @bookmark_menu = current_customer.bookmark_menus.includes(:customer).order(created_at: :desc).page(params[:page_1]).per(3)
    
    @menus = current_customer.menus.all.page(params[:page]).per(3)
  end
  
  def withdraw
    @customer = Customer.find(current_customer.id)
    if @customer.update(is_deleted: true)
      #sessionIDのresetを行う
      reset_session
      flash[:notice] = "退会処理を実行しました。"
      redirect_to root_path
    else
      flash[:notice] = " 退会に失敗しました。"
      render :show
    end
  end
  
  

  def edit
    @customer = Customer.find(current_customer.id)
  end
  
  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to mypage_path
    else
      render :edit
    end
  end

  def quit
    
  end

  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:email,:user_name)
  end
  
  def move_to_signed_in
    unless customer_signed_in?
      
      redirect_to  '/customers/sign_in'
    end
  end
  
end
