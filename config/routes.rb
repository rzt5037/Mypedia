Rails.application.routes.draw do
  devise_for :users

  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end

  resources :charges, only: [:new, :create, :update]

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
end
