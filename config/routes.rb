Rails.application.routes.draw do
  devise_for :users
  root "main#index"

  resources :discussions do
    resources :posts, only: [:show, :create, :edit, :update], module: :discussions
  end
end
