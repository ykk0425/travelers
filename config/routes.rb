Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
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
  end
  get "search" => "searches#search"
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

