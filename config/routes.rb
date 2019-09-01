Rails.application.routes.draw do
  resources :personal_data, only: [:index, :show, :new, :create]
end
