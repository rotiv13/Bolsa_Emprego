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
  get '/index/entitie', to: 'users#index_entitie'
  get '/index/candidate', to: 'users#index_candidate'
  resources :users
  #SESSIONS
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  #ACCOUNT ACTIVATIONS
  resources :account_activations, only: [:edit]

  #BACKOFFICE
  get '/backoffice' ,to: 'backoffice#home'
  get '/backoffice/users', to: 'backoffice#index_users'
  get '/backoffice/news', to: 'backoffice#index_news'

  resources :backoffice

  #OFFERS
  resources :offers
  get 'offers/new'

  get '/offer', to: 'offers#index'
  get '/offers', to: 'offers#search'

  get 'offers/show'

  get 'offers/edit'
end
