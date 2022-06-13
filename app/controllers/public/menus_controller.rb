class Public::MenusController < ApplicationController
  before_action :current_customer_signed_in?, only: [ :edit, :update, :destroy]
  before_action :move_to_signed_in, only: [ :new, :edit]
  
  
  def new
    @menu = Menu.new
  end
  
  def create
    @menu = Menu.new(menu_params)
    @menu.customer_id = current_customer.id #投稿者が編集、削除できるように
    
    @menu.save
    flash[:notice] = "メニューを投稿しました！"
    redirect_to menu_path(menu.id)
  end
  
  

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
    @comment = Comment.new
  end

  def edit
    @menu = Menu.find(params[:id])
  end
  
  def update
    @menu = Menu.find(params[:id])
    @menu.update(menu_params)
    flash[:notice] = "メニューを編集しました！"
    redirect_to menus_path
  end
  
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    flash[:notice] = "メニューを削除しました"
    redirect_to request.referer
  end
  
  def diagnosis
    params[:plan_name]
      @menu_plan_name = Menu.where(plan_name: params[:plan_name])
      @menus = @menu_plan_name.all
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
    params.require(:menu).permit( :name, :description, :plan_name, :site_name)
  end
  
  def move_to_signed_in
    unless customer_signed_in?
      
      redirect_to  '/customers/sign_in'
    end
  end
  
  def current_customer_signed_in?
    @menu = Menu.find(params[:id])
    @customer = @menu.customer
    
    redirect_to (menus_path) unless @customer == current_customer
  end
  
end

