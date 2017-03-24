require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :vacancies, except: [:edit, :update, :destroy]

  root to: "vacancies#index"
end
