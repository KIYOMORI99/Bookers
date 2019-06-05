Rails.application.routes.draw do
  

  root 'top#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top/top'
  get 'top/about'
  resources :users
  resources :post_books
end
