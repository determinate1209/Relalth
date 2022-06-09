class Admin::PlansController < ApplicationController
  def index
    @plans = Plan.all
    @plan = Plan.new
  end
  
  def create
    @plan = Plan.new(plan_params)
    @plan.save
    redirect_to request.referer
  end
  
  def show
    @plan = Plan.find(params[:id])
    @menus = @plan.menus
  end

  def edit
    @plan = Plan.find(params[:id])
  end
  
  def update
    @plan = Plan.find(params[:id])
    @plan.update(plan_params)
    redirect_to request.referer
  end
  
  
  private
  
  def plan_params
    params.require(:plan).permit(:name)
  end
end
