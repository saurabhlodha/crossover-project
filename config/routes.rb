Rails.application.routes.draw do
  resources  :sessions, only: [:create, :destroy]
  resources :trips, except: [:new, :edit]
  resources :users, except: [:new, :edit]
end
