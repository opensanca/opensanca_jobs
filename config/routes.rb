Rails.application.routes.draw do
  resources :vacancies, except: [:edit, :update, :destroy]

  root to: "vacancies#index"
end
