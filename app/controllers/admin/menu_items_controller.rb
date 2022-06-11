class Admin::MenuItemsController < ApplicationController
  def destroy
    menu = Menu.find(params[:menu_id])
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy
    redirect_to request.referer
  end
end
