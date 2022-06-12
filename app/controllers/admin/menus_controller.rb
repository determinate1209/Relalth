class Admin::MenusController < ApplicationController

  def index
    if params[:plan_name] == "ichiran"
      @menus = Menu.all
    elsif params[:plan_name]
      @menu_plan_name = Menu.where(plan_name: params[:plan_name])
      @menus = @menu_plan_name.all
    else
      @menus = Menu.all
    end
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
  
  def search
    if params[:name].present?
      @menus = Menu.where('name LIKE(?) OR description LIKE(?)', "%#{params[:name]}%", "%#{params[:name]}%")
    else
      @menus = Menu.none
      
    end
  end
  
  
  private
  
  def menu_params
    params.require(:menu).permit( :name, :description, :plan_id)
  end
  
end
