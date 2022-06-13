class Public::BookmarksController < ApplicationController
  def create
    @menu = Menu.find(params[:menu_id])
    bookmark = current_customer.bookmarks.new(menu_id: @menu.id)
    bookmark.save
    
    
  end
  
  def destroy
    @menu = Menu.find(params[:menu_id])
    bookmark = current_customer.bookmarks.find_by(menu_id: @menu.id)
    bookmark.destroy
    
  end
  
end

