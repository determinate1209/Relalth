class Public::CommentsController < ApplicationController
  def create
    menu = Menu.find(params[:menu_id])
    @comment = Comment.new(comment_params)
    @comment.menu_id = menu.id
    @comment.customer_id = current_customer.id
    
    @comment.save
    redirect_to request.referer
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
  
end
