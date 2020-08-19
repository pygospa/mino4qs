Rails.application.routes.draw do
  devise_for :users
  root "uncategorized_pages#landing_page"
end
