Rails.application.routes.draw do
  get 'candidates/new'

  get 'entities/new'

  get '/signup', to: 'users#new'

  root 'static_pages#home'

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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
