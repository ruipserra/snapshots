Rails.application.routes.draw do
  root to: 'snapshots#index'

  resources :snapshots, only: [:index]
end
