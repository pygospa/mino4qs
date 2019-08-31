Rails.application.routes.draw do
  resources :personal_data, only: [:index, :new, :create]
#  get  'personal_data/index', to: 'personal_data#index'
#  get  'personal_data/new',   to: 'personal_data#new'
#  post 'personal_data',       to: 'personal_data#create'
end
