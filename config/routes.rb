# frozen_string_literal: true

Rails.application.routes.draw do   
  devise_for :model_1s
  # get /users to controler to action 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "users#index"

    resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new] do
    resources :comments, only: [:create, :new]
    resources :likes, only: [:create]
    resources :comments, only: [:index, :show]
    resources :likes, only: [:index, :show]

    




  end
end