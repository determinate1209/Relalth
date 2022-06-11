class Admin::MenusController < ApplicationController

  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
    
    @menu_item = MenuItem.new
  end

  def edit
    @menu = Menu.find(params[:id])
  end
  
  def update
    @menu = Menu.find(params[:id])
    @menu.update(menu_params)
    redirect_to menu_path(@menu)
  end
  
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to request.referer
  end
  
  
  private
  
  def menu_params
    params.require(:menu).permit( :name, :description, :plan_id)
  end
  
end
