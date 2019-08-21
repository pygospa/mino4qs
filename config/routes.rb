Rails.application.routes.draw do
  get '/personaldata', to: 'personaldata#index'
end
