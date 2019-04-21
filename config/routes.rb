Rails.application.routes.draw do

  namespace :api, defaults: { format: 'json'} do
    get 'works/search', to: 'works#search'
    resources :works
  end

  namespace :api, defaults: { format: 'json'} do
    get 'users/search', to: 'users#search'
    resources :users
  end

  namespace :api, defaults: { format: 'json'} do
    get 'categories/search', to: 'categories#search'
    resources :categories
  end

  namespace :api, defaults: { format: 'json'} do
    get 'work_categories/search', to: 'work_categories#search'
    resources :work_categories
  end

  root to: 'pages#home'
  get 'about', to: 'pages#about'

  resources :works

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories, except: [:destroy]

end
