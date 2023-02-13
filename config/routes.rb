Rails.application.routes.draw do
  devise_for :users
  root "main#index"

  resources :discussions, only: [:index, :create, :new]
end
