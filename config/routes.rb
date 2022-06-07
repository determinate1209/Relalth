Rails.application.routes.draw do
  namespace :public do
    get 'menu_items/edit'
  end
  namespace :public do
    get 'menus/new'
    get 'menus/index'
    get 'menus/show'
    get 'menus/edit'
  end
  namespace :public do
    get 'hearings/new'
    get 'hearings/show'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/quit'
  end
  namespace :admin do
    get 'comments/index'
  end
  namespace :admin do
    get 'menus/new'
    get 'menus/show'
  end
  namespace :admin do
    get 'plans/index'
    get 'plans/show'
    get 'plans/edit'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  #顧客
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  #管理者
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: 'admin/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
