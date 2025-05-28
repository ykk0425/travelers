Rails.application.routes.draw do

  namespace :public do
    get 'spots/show'
  end
  #管理者新規登録・パスワード機能は不要とするため、不要となるルーティングをスキップする↓
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:show, :destroy]
  end

  scope module: :public do
    devise_for :users, controllers: { 
      sessions: 'public/users/sessions',
      registrations: 'public/users/registrations' 
    }
    devise_scope :user do
      post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
    end
  
    root to: 'homes#top'
    get 'homes/about' => 'homes#about', as: 'about'
    get 'users/mypage' => 'users#mypage', as: 'mypage'
    resources :users, only: [:show, :index]
    resources :plans do
      resources :comments, only: [:create, :destroy]
    end
    resources :spots do
      resources :spot_images, only: [:destroy]
              #プラン詳細にマップ表示する
      resource :map, only: [:show]
    end
    get "search" => "searches#search"
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

