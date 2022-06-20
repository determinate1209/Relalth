class Public::MenuItemsController < ApplicationController
  def edit
    @menu_item = MenuItem.find(params[:id])
  end
  
  def create
    @menu = Menu.find(params[:menu_id])
    @menu_items = @menu.menu_items.order("stretch_number").page(params[:page_1]).per(4)
    menu_item = MenuItem.new(menu_item_params)
    menu_item.menu_id = @menu.id
    if menu_item.save
      
    else
      flash[:notice] = "ストレッチの説明を記入してください"
      redirect_to menu_path(@menu.id)
    end
    
  end
  
  
  def update
    menu = Menu.find(params[:menu_id])
    @menu_item = MenuItem.find(params[:id])
    if @menu_item.update(menu_item_params)
      flash[:notice] = "ストレッチの内容がを更新されました。"
      redirect_to menu_path(menu.id)
    else
      render 'edit'
    end
  end
  
  def destroy
    refroute = Rails.application.routes.recognize_path(request.referrer)
    @menu = Menu.find(refroute[:id])
    @menu_items = @menu.menu_items.order("stretch_number").page(params[:page_1]).per(4)
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy
    
  end
  
  
   
  private
  
  def menu_item_params
    params.require(:menu_item).permit(:stretch_number, :description, :image)
  end
end
