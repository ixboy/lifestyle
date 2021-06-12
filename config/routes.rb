Rails.application.routes.draw do
  resources :articles
  resources :users
  # get '/signup', to: 'users#new'
  # post '/signup', to: 'users#create'
  root 'articles#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
end
