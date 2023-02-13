Rails.application.routes.draw do
  resources :categories
  devise_for :users
  root "main#index"

  resources :discussions do
    resources :posts, only: [:show, :create, :edit, :update, :destroy], module: :discussions
  end
end
