class Admin::CommentsController < ApplicationController
  
  def destroy
    refroute = Rails.application.routes.recognize_path(request.referrer)
    @menu = Menu.find(refroute[:id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    
  end
end

