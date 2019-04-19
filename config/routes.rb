Rails.application.routes.draw do

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
