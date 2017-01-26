Rails.application.routes.draw do
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]

  get '/home', to: 'static_pages#index'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  # Changes for task 5.1
  #root 'static_pages#landing_page'
  root 'products#index'
end
