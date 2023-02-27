Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_for :users
  root to: "homes#top"
  
  get "/home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  resources :users, only: [:index,:show,:edit,:update]
  resource :favorites, only: [:create, :destroy]
  # idを特定しなくても良い時にresourceを使用する。
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
