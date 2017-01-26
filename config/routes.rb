Rails.application.routes.draw do
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  # root 'static_pages#index'
  root 'static_pages#landing_page'
  get '/home', to: 'static_pages#index'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
end
