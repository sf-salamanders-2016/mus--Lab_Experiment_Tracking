Rails.application.routes.draw do
  devise_for :users
  root 'experiments#index'
end
