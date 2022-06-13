class Admin::MenuItemsController < ApplicationController
  def destroy
    refroute = Rails.application.routes.recognize_path(request.referrer)
    @menu = Menu.find(refroute[:id])
    @menu_items = @menu.menu_items
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy
    redirect_to request.referer
  end
end
