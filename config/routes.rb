Rails.application.routes.draw do
<<<<<<< HEAD
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======

  get 'comments/index'
  get 'users/index'
  get 'observation/index'
  get 'experiments/index'

  resources :users
  resources :experiments
  resources :observations
  resources :comments

>>>>>>> a9c01605e92ce1a1f68be1b03b3ac9c205ebff83
end
