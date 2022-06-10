class Public::MenusController < ApplicationController
  def new
    @menu = Menu.new
  end
  
  def create
    @menu = Menu.new(menu_params)
    @menu.customer = current_customer.id #誰が投稿したかわかるように
    
    @menu.create
    redirect_to 
  end

  def index
  end

  def show
  end

  def edit
  end
end
