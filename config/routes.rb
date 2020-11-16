Rails.application.routes.draw do
  resources :board_messages
  resources :board_users
  resources :data_pages
  get 'hello/index'
  get 'hello/login_check'
  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
