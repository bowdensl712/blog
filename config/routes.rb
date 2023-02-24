# frozen_string_literal: true

Rails.application.routes.draw do
  root 'articles#index'

  resources :articles do
    resources :comments
  end

  post '/articles/:id', to: 'articles#upload'
end
