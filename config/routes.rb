Rails.application.routes.draw do
  devise_for :users
  resources :foods

  resources :diaries

  resources :users, only: [] do
    resource :calories_bound, only: [:create, :edit, :update]
  end

  root to: 'diaries#index'
end
