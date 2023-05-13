Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :annonces
  devise_for :users
  root to: "pages#home"
  get 'categories/:id', to: 'annonces#show_category', as: 'annonces_show_category'

  resources :contacts, only: [:new, :create]
  resources :favorites, only: [:create, :destroy]
  get '/favorites', to: 'favorites#index', as: :user_favorites
  resources :images, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
