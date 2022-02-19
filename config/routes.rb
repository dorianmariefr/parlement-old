Rails.application.routes.draw do
  resource :session
  resources :users
  resources :people do
    resources :relations
  end

  root "pages#index"
end
