class Public::MenusController < ApplicationController
  before_action :current_customer_signed_in?, only: [ :edit, :update, :destroy]
  before_action :move_to_signed_in, only: [ :new, :edit]
  
  
  def new
    @menu = Menu.new
  end
  
  def create
    @menu = Menu.new(menu_params)
    @menu.customer_id = current_customer.id #投稿者が編集、削除できるように
    
    if @menu.save
      flash[:notice] = "メニューを投稿しました！"
      redirect_to menu_path(@menu.id)
    else
      render 'new'
    end
  end
  
  

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
    @menu_item = MenuItem.new
    @comment = Comment.new
    @comments = @menu.comments.order(created_at: :desc).page(params[:page_2]).per(8)
    

  end

  def edit
    @menu = Menu.find(params[:id])
  end
  
  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      flash[:notice] = "メニューを編集しました！"
      redirect_to menus_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    flash[:notice] = "メニューを削除しました"
    redirect_to menus_path
  end
  
  def diagnosis
    params[:plan_name]
    params[:site_name]
      @menu_plan_name = Menu.where(plan_name: params[:plan_name], site_name: params[:site_name])
      @menus = @menu_plan_name.all.page(params[:page]).per(4)
  end
  
  def search
    if params[:name].present?
      @menus = Menu.where('name LIKE(?) OR description LIKE(?)', "%#{params[:name]}%", "%#{params[:name]}%").page(params[:page]).per(4)
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

