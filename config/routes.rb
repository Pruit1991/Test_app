# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  resources :orders
  devise_for :users
  ActiveAdmin.routes(self)
  resource :users, only: [:show]
  resources :organizations
  resources :org_members
end
