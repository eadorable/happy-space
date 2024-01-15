# config/routes.rb

Rails.application.routes.draw do
  root to: 'parents#welcome'
  resources :parents do
    resources :plays, only: [:new, :create, :update, :edit, :destroy] do
    end
  end
  # get 'index', to: 'playss#index'
  # get 'show', to: 'plays#show'
  resources :plays, only: [:index, :show]
  get 'thank_you', to: 'parents#thank_you'
  get 'welcome', to: 'parents#welcome'

  # Other routes...
end
