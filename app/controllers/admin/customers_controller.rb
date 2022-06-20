class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page]).per(8)
  end

  def show
    @customer = Customer.find(params[:id])
    @menus = @customer.menus.page(params[:page]).per(4)
    
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update 
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を編集しました。"
      redirect_to admin_customer_path(@customer)
    else
      render 'edit'
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :user_name, :email, :is_deleted)
  end
end
