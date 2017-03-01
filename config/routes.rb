Rails.application.routes.draw do
  resources :vacancies, only: [:new, :index, :create]

  root to: "vacancies#index"
end
