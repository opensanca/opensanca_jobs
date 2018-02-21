# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  resources :passwords, controller: 'clearance/passwords', only: %i[create new]
  resource :session, controller: 'clearance/sessions', only: [:create]

  resources :users, controller: 'users', only: [:create] do
    resource :password,
             controller: 'clearance/passwords',
             only: %i[create edit update]
  end

  get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
  delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
  get '/sign_up' => 'clearance/users#new', as: 'sign_up'

  mount Sidekiq::Web => '/sidekiq'

  resources :vacancies, except: %i[edit update destroy]

  root to: 'vacancies#index'
end
