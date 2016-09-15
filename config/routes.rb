Rails.application.routes.draw do

  get 'comments/index'
  get 'users/index'
  get 'observation/index'
  get 'experiments/index'

  resources :users
  resources :experiments
  resources :observations
  resources :comments

end
