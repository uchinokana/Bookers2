Rails.application.routes.draw do
  devise_for :users
  get '/home/about' => 'homes#about', as: "about"
  root to: "homes#top"
  
  resources :books do
  resources :favorites, only: [:create, :destroy]
  resources :iines, only: [:create, :destroy]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update]
end
