Rails.application.routes.draw do
  resource :session
  resources :users
  resources :people

  root "pages#index"
end
