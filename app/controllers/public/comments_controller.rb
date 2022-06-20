class Public::CommentsController < ApplicationController
  def create
    @menu = Menu.find(params[:menu_id])
    @comments = @menu.comments.order(created_at: :desc).page(params[:page_2]).per(8)
    comment = current_customer.comments.new(comment_params)
    comment.menu_id = @menu.id
    if comment.save
      
    else
      flash[:notice] = "コメント内容を記入してください。"
      redirect_to menu_path(@menu.id)
    end
  end
  
  def destroy
    refroute = Rails.application.routes.recognize_path(request.referrer)
    @menu = Menu.find(refroute[:id])
    @comments = @menu.comments.order(created_at: :desc).page(params[:page_2]).per(8)
    @comment = Comment.find(params[:id])
    @comment.destroy
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
  
end
