Rails.application.routes.draw do
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]

  get '/home', to: 'static_pages#index'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  post '/contact/thank_you', to: 'static_pages#thank_you'

  root 'static_pages#landing_page'
end
