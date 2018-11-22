Rails.application.routes.draw do
  get 'errors/page_not_found'
  get 'home/index'
  root 'home#index'
  resources :sites
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
