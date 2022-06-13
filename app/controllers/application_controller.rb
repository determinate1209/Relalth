class ApplicationController < ActionController::Base
   # URLにadminが含まれるページはadminにログインしないと見れないよ
  before_action :authenticate_admin!, if: :admin_url

  def admin_url
    request.fullpath.include?("/admin")
  end
  
  
end
