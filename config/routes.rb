Rails.application.routes.draw do
  root 'articles#index'  
  get 'search', to:"articles#search"
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
end
