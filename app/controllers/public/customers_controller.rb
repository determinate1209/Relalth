class Public::CustomersController < ApplicationController
  before_action :move_to_signed_in, only: [ :show, :edit]
  before_action :current_customer_signed_in?, only: [:edit, :update, :withdraw]
  
  def show
    bookmark= Bookmark.where(customer_id: current_customer.id
    ).pluck(:menu_id)
    @bookmark_menu = Menu.find(bookmark)
  end
  
  

  def edit
    @customer = Customer.find(current_customer.id)
  end
  
  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    flash[:notice] = "会員情報を更新しました。"
    redirect_to mypage_path
  end

  def quit
    
  end
  
  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    #sessionIDのresetを行う
    reset_session
    flash[:notice] = "退会処理を実行しました。"
    redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name,
                                     :first_name,
                                     :email,
                                     :user_name)
  end
  
  def move_to_signed_in
    unless customer_signed_in?
      
      redirect_to  '/customers/sign_in'
    end
  end
  
  def correct_customer
    @customer = Customer.find(params[:id])
    
    redirect_to (mypage_path) unless @customer == current_customer
  end
end
