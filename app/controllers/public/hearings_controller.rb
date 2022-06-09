class Public::HearingsController < ApplicationController
  def new
    @hearing = Hearing.new
  end

  def show
    @hearing = Hearing.find(params[:id])
  end
  
  def create
    @hearing = Hearing.new(hearing_params)
    if @hearing.save
      redirect_to hearing_path(@hearing.id)
    else
      root_path
    end
  end
  
  private
  
  def hearing_params
    params.require(:hearing).permit(:question1, :question2, :question3, :question4)
  end
end
