Rails.application.routes.draw do
  root to: 'home#index'
  resources :users, only: [:new, :create, :index, :show]
  resources :time_counts, only: [:new, :create, :show]
end
