Rails.application.routes.draw do

  resources :projects

  get 'dashboard/index'

  devise_for :users

  root to: 'projects#index'

end
