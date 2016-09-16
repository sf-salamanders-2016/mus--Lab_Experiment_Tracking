Rails.application.routes.draw do

  # get 'comments/index'
  # # get 'users/index'
  # get 'observation/index'
  # get 'experiments/index'

  devise_for :users

  root 'experiments#index'

  resources :users do
    resources :experiments do
        get 'applications', to: 'experiments#application'
        patch 'approval', to: 'experiments#approval'
        resources :observations, except: [:index]
    end
  end

  # resources :experiments
  # resources :observations
  # resources :comments

end
