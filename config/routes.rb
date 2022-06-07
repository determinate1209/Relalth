Rails.application.routes.draw do
  #顧客
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  #管理者
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: 'admin/sessions'
  }
  
  root to: 'public/homes#top'#top
  
 
  scope module: :public do
    get 'about'
    get 'bookmark' => 'bookmarks#index'#お気に入り一覧
    resources :menus, only: [:new, :index, :show, :edit, :create, :update] do #メニュー機能
      resource :menu_items, only: [:edit, :create, :update]#メニューアイテム関連機能
      resource :comments, only: [:create, :destroy]#コメント機能
      resource :bookmarks, only: [:create, :destroy]#お気に入り機能
    end
    resources :hearings, only: [:new, :show, :create]#顧客診断機能
    resources :customers, only: [:show, :edit, :update]#顧客会員情報機能
    get 'customers/quit' => 'customers#quit'#退会確認ページ
    patch 'customers/withdraw' => 'customers#withdraw'#退会処理
  end
  
  namespace :admin do
    resources :comments, only: [:index, :destroy] #管理者コメント一覧機能
    resources :menus, only: [:new, :show, :create, :edit, :update, :destroy]#管理者メニュー機能
    resources :plans, only: [:index, :show, :edit, :create, :update, :destroy]#管理者プラン作成機能
    resources :customers, only: [:index, :show, :edit, :update]#管理者会員情報機能
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
