# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :vacancies, except: %i[edit update destroy]

  root to: 'vacancies#index'
end
