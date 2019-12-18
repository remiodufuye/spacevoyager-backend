Rails.application.routes.draw do  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end

  # example ------ get '/popular/:page', to: 'movie#popular'
  get '/marsrover', to: 'renderings#marsroverInitial'
  get '/nasalibrary', to: 'renderings#nasalibraryInitial'
  post '/searchwithkeyword', to: 'renderings#nasalibraryWithKeyword'
  get '/marsweather', to: 'renderings#marsweather'

  resources :libraries, only: [:create, :destroy]
  get '/mylibraries', to: 'libraries#mylibraries'

  resources :save_items, only: [:create]
  post '/delitemfromlib', to: 'save_items#destroy'

  get '/myitems', to: 'items#myitems'
  
end
