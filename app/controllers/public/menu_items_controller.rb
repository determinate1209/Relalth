class Public::MenuItemsController < ApplicationController
  def edit
    @menu_item = MenuItem.find(params[:id])
  end
  
  def create
    @menu = Menu.find(params[:menu_id])
    menu_item = MenuItem.new(menu_item_params)
    menu_item.menu_id = @menu.id
    menu_item.save
    
  end
  
  
  def update
    menu = Menu.find(params[:menu_id])
    @menu_item = MenuItem.find(params[:id])
    @menu_item.update(menu_item_params)
    redirect_to menu_path(menu.id)
  end
  
  def destroy
    refroute = Rails.application.routes.recognize_path(request.referrer)
    @menu = Menu.find(refroute[:id])
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy
    
  end
   
  private
  
  def menu_item_params
    params.require(:menu_item).permit(:stretch_number, :description, :image)
  end
end
