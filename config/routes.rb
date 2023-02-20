# frozen_string_literal: true

Rails.application.routes.draw do
  root 'articles#index'
  get 'articles/results', to: 'articles#results'

  resources :articles do
    resources :comments
  end
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
end
