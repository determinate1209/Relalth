class Admin::MenusController < ApplicationController

  def index
    if params[:site_name] == "zenshin"
      @menus = Menu.all
    elsif params[:site_name]
      @menu_site_name = Menu.where(site_name: params[:site_name])
      @menus = @menu_site_name.all
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
