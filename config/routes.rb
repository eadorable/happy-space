# config/routes.rb

Rails.application.routes.draw do
  root to: 'parents#welcome'
  resources :parents do
    resources :plays do

    end
  end
  get 'thank_you', to: 'parents#thank_you'
  get 'welcome', to: 'parents#welcome'

  # Other routes...
end
