Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  resources :works

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

end
