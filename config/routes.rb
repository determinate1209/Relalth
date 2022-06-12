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
  get 'about' => 'public/homes#about'
 
  scope module: :public do
    get 'bookmark' => 'bookmarks#index'#お気に入り一覧
    resources :menus, only: [:new, :index, :show, :edit, :create, :update, :destroy] do #メニュー機能
      get :search, on: :collection#メニュー検索機能
      resources :menu_items, only: [:edit, :create, :update, :destroy]#メニューアイテム関連機能
      resources :comments, only: [:create, :destroy]#コメント機能
      resource :bookmarks, only: [:create, :destroy]#お気に入り機能
    end
    
    
    resources :plans, only: [:show]
    
    resources :hearings, only: [:new, :show, :create]#診断機能
    resource :customers, only: [:show, :update] do #顧客会員情報機能
      get :bookmarks, on: :collection 
    end
    get 'customer/edit'  => 'customers#edit'
    patch 'customers/withdraw' => 'customers#withdraw'#退会処理
    get 'customers/quit' => 'customers#quit'#退会確認ページ
    
  end
  
  namespace :admin do
    resources :comments, only: [:index, :destroy] #管理者コメント一覧機能
    resources :menus, only: [:show, :edit, :update, :destroy, :index]do#管理者メニュー機能(一覧、詳細、削除、所属するプランを変更）
      get :search, on: :collection#メニュー検索機能
      resources :menu_items, only: [:destroy]#不適切な投稿を削除できるように
      resources :comments, only: [:index, :destroy] #管理者コメント一覧機能
    end
    resources :plans, only: [:index, :show, :edit, :create, :update]#管理者プラン作成機能
    resources :customers, only: [:index, :show, :edit, :update]#管理者会員情報機能
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
