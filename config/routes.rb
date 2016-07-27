Rails.application.routes.draw do


  #ROOT
  root 'static_pages#home'
  #OFFERS
  #NEWS
  resources :news
  get '/new_news', to: 'news#new'
  post '/new_news', to: 'news#create'
  #USERS
  get '/signup', to: 'users#new'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get '/new_candidate' , to:'users#new_candidate'
  post '/new_candidate', to:'users#create'
  get '/new_entitie' , to:'users#new_entitie'
  post '/new_entitie', to:'users#create'
  get '/index', to: 'users#index'
  post '/index', to: 'users#index'
  resources :users
  #SESSIONS
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  #ACCOUNT ACTIVATIONS
  resources :account_activations, only: [:edit]

  #BACKOFFICE
  get '/backoffice/home' ,to: 'backoffice#home'
  resources :backoffice

end
