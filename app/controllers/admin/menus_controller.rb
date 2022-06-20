class Admin::MenusController < ApplicationController

  def index
    if params[:site_name] == "ichiran"
      @menus = Menu.all.page(params[:page]).per(4)
    elsif params[:site_name]
      @menu_site_name = Menu.where(site_name: params[:site_name])
      @menus = @menu_site_name.all.page(params[:page]).per(4)
    else
      @menus = Menu.all.page(params[:page]).per(4)
    end
  end


  def show
    @menu = Menu.find(params[:id])
    @menu_items = @menu.menu_items.order("stretch_number").page(params[:page_1]).per(4)
    @comments = @menu.comments.order(created_at: :desc).page(params[:page_2]).per(8)
  end

  def edit
    @menu = Menu.find(params[:id])
  end
  
  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      flash[:notice] = "内容を編集しました。"
      redirect_to menu_path(@menu)
    else
      render 'edit'
    end
  end
  
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    flash[:notice] = "メニューを削除しました"
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
