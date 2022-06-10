class Public::MenusController < ApplicationController
  def new
    @menu = Menu.new
  end
  
  def create
    @plan = Plan.all
    @menu = Menu.new(menu_params)
    @menu.customer_id = current_customer.id #誰が投稿したかわかるように
    
    @menu.save
    redirect_to menus_path
    
  end
  
  

  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
    
    @menu_item = MenuItem.new
  end

  def edit
    @menus = Menu.find(params[:id])
  end
  
  def update
    @menu = Menu.find(params[:id])
    @menu.update(menu_params)
    redirect_to menu_path(@menu)
  end
  
  private
  
  def menu_params
    params.require(:menu).permit( :name, :description, :plan_id)
  end
  
end

