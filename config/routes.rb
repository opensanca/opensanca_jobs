Rails.application.routes.draw do
  resources :vacancies
  get "vacancies/index"
  get "vacancies/new"

  root to: "vacancies#index"
end
