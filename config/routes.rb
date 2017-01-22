Rails.application.routes.draw do
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  # root 'static_pages#index'
  root 'static_pages#landing_page'
  get 'static_pages/index'
  get 'static_pages/about'
  get 'static_pages/contact'
end
