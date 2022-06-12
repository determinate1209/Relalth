class Public::BookmarksController < ApplicationController
  def create
    menu = Menu.find(params[:menu_id])
    bookmark = Bookmark.new(menu_id: menu.id)
    bookmark.customer_id = current_customer.id
    
    bookmark.save
    redirect_to request.referer
    
  end
  
  def destroy
    menu = Menu.find(params[:menu_id])
    bookmark = Bookmark.find_by(menu_id: menu.id)
    bookmark.customer_id = current_customer.id
    bookmark.destroy
    redirect_to request.referer
    
  end
  
end
