Rails.application.routes.draw do
  resources :requests, except: [:new, :edit]
  resources :sessions, only: [:create, :destroy]
  resources :users, except: [:new, :edit]
end
