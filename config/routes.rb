Rails.application.routes.draw do
  get 'notices/index'
  get 'notices/new'
  get 'notices/create'
  get 'notices/show'
  resources :dashboard, only: :index
  root 'employees#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :employees do
    resources :profiles
  end
end
