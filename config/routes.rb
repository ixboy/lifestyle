Rails.application.routes.draw do
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
    post 'logout' => :destroy
  end
  resources :articles do
    resources :votes, only: %i[new create destroy]
  end
  resources :categories
  resources :articles
  resources :users
  root 'articles#index'  
end
