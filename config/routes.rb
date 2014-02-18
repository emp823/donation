Donator::Application.routes.draw do
  devise_for :users

  root 'static_pages#home'

  resources :users

  resources :donations
end
