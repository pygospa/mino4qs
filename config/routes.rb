Rails.application.routes.draw do
  get 'personal_data/index', to: 'personal_data#index'
  get 'personal_data/new',   to: 'personal_data#new'
end
