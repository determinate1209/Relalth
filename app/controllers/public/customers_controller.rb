class Public::CustomersController < ApplicationController
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
    redirect_to customer_path
  end

  def quit
    
  end
  
  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    #sessionIDのresetを行う
    reset_session
    redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name,
                                     :first_name,
                                     :email,
                                     :user_name)
  end
end
