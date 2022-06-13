# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create] #退会しているか確認するアクション
  # before_action :configure_sign_in_params, only: [:create]
  
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  
    #退会しているか確認するメソッド
    def customer_state
      @customer = Customer.find_by(email: params[:customer][:email])#入力されたメールアドレスからアカウントを取得
      
      
      return if !@customer # もし@customerがある（!true=false）なら下の処理へ、ない（!false=true）ならreturn(終了)して
      
      if @customer.valid_password?(params[:customer][:password]) && !(@customer.is_deleted?)
        #取得したアカウントのパスワードと入力されたパスワードが一致（true）　かつ　is_withdrawalが（false）
      else
        # !true（false）だった場合、退会しているのでサインアップ画面に遷移する
        redirect_to new_customer_registration_path
      end
      
    end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  private
  
    def after_sign_in_path_for(resource)
      flash[:notice] = "ログインできました。ようこそRELALTHへ！"
      mypage_path
    end
  
    def after_sign_out_path_for(resource)
      flash[:notice] = "ログアウトが完了しました、ご利用ありがとうございました！"
      root_path
    end
  
end
