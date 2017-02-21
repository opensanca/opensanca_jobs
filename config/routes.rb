Rails.application.routes.draw do
  get 'jobs/index'

  root to: 'jobs#index'
end
