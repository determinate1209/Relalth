class Admin::CommentsController < ApplicationController
  
  def destroy
    refroute = Rails.application.routes.recognize_path(request.referrer)
    @menu = Menu.find(refroute[:id])
    @comments = @menu.comments.order(created_at: :desc).page(params[:page_2]).per(8)
    @comment = Comment.find(params[:id])
    @comment.destroy
    
  end
end

