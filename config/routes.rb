Rails.application.routes.draw do
  resources :searches, path: 'search'
  devise_for :users
  resources :advertisments
  get 'errors/page_not_found'
  get '/', to: 'home#index'
  root 'home#index'
  resources :sites
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
