Rails.application.routes.draw do
  resources :personal_data_sets, only: [:index, :show, :new, :create]
end
