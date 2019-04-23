Rails.application.routes.draw do

  resources :images

namespace :api, defaults: { format: 'json'} do
    namespace :v1 do
  get 'users/search', to: 'users#search'
    resources :users
      post 'auth_user' => 'authentication#authenticate_user'

  end
end

namespace :api, defaults: { format: 'json'} do
    namespace :v1 do
  get 'categories/search', to: 'categories#search'
    resources :categories
      post 'auth_category' => 'authentication#authenticate_category'

  end
end

namespace :api, defaults: { format: 'json'} do
    namespace :v1 do
  get 'work_categories/search', to: 'work_categories#search'
    resources :work_categories
      post 'auth_work_category' => 'authentication#authenticate_work_category'

  end
end

namespace :api, defaults: { format: 'json'} do
    namespace :v1 do
  get 'works/search', to: 'works#search'
    resources :works
      post 'auth_work' => 'authentication#authenticate_work'

  end
end

namespace :api, defaults: { format: 'json'} do
    namespace :v1 do
  get 'images/search', to: 'images#search'
    resources :images
      post 'auth_image' => 'authentication#authenticate_image'

  end
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
