Rails.application.routes.draw do

  get 'annonces/index'
  get 'annonces/show'
  get 'annonces/new', as: 'new_annonce'
  get 'annonces/edit'
  get 'annonces/create'
  get 'annonces/update'
  get 'annonces/destroy'
  devise_for :users
  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
