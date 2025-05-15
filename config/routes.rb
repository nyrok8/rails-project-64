# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, only: %i[sessions registrations]

  resources :posts, only: %i[index show new create] do
    resources :comments, only: :create
    resource :like, only: %i[create destroy]
  end
end
