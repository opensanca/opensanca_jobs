Rails.application.routes.draw do
  get 'vacancies/index'

  root to: 'vacancies#index'
end
