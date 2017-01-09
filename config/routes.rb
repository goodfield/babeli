Rails.application.routes.draw do

  get 'projects/show'

  resources :projects

  get 'dashboard/index'

  devise_for :users

  root to: 'projects#index'

end
