class Public::MenuItemsController < ApplicationController
  def edit
    @menu_item = MenuItem.find(params[:id])
  end
  
  def create
    menu = Menu.find(params[:menu_id])
    @menu_item = MenuItem.new(menu_item_params)
    @menu_item.menu_id = menu.id
    @menu_item.save
    redirect_to request.referer
  end
  
  def update
    menu = Menu.find(params[:menu_id])
    @menu_item = MenuItem.find(params[:id])
    @menu_item.update(menu_item_params)
    redirect_to menu_path(menu.id)
  end
  
  def destroy
    menu = Menu.find(params[:menu_id])
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy
    redirect_to request.referer
    
  end
   
  private
  
  def menu_item_params
    params.require(:menu_item).permit(:stretch_number, :description, :image)
  end
end
