Rails.application.routes.draw do
  root to: 'snapshots#index'

  resources :snapshots, only: [:index] do
    collection do
      post '/' => 'snapshots#create', constraints: { format: :json }
    end
  end
end
