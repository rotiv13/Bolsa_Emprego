Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  #ROOT
  root 'static_pages#home'
  #OFFERS
  post '/offers/new', to: 'offers#create'
  #NEWS
  resources :news
  post '/news/new', to: 'news#create'

  #USERS
  resources :users do
    member do
      get :following, :followers, :offerings, :offerends
    end
  end
  get '/signup', to: 'users#new'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get '/new_candidate' , to:'users#new_candidate'
  post '/new_candidate' , to:'users#create'

  get '/new_entitie' , to:'users#new_entitie'
  post '/new_entitie' , to:'users#create'

  get '/entities', to: 'users#index_entitie', as: 'index_entitie'
  get '/candidates', to: 'users#index_candidate', as: 'index_candidate'
  get '/users/:id/edit_password', to: 'users#edit_password', as: 'edit_password'

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
  get '/backoffice/users/:id', to: 'backoffice#show_users', as: 'backoffice_show_users'
  get '/backoffice/news/:id', to: 'backoffice#show_news', as: 'backoffice_show_news'
  get '/backoffice/news/:id/edit', to:'backoffice#edit_news', as: 'backoffice_edit_news'
  patch '/backoffice/news/:id/edit', to:'news#update'
  get '/backoffice/users/:id/edit', to:'backoffice#edit_users', as: 'backoffice_edit_users'
  get '/backoffice/users/:id/edit_password', to:'backoffice#edit_user_password', as: 'backoffice_edit_user_password'
  patch '/backoffice/users/:id/edit_password', to:'users#update'
  patch '/backoffice/users/:id/edit', to:'users#update'
  post '/backoffice/new', to:'users#create'
  resources :backoffice

  #OFFERS
  put '/offer/:id/deactivate', to: 'offers#deactivate', as: 'offer_deactivate'
  put '/offer/:id/activate', to: 'offers#activate', as: 'offer_activate'
  resources :offers
  get '/offer', to: 'offers#index'


  #RELATIONSHIPS
  resources :relationships, only: [:create, :destroy]
  resources :offer_relationships,       only: [:create, :destroy]

  resources :password_resets,     only: [:new, :create, :edit, :update]
end
