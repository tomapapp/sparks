Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users

  # Onboarding routes
  get '/edit_preferences', to: "pages#my_preferences"
  post '/edit_preferences', to: "pages#add_preferences"

  get '/edit_date_info', to: "pages#my_date_info"

  # Profile routes
  get 'profiles/couple_profile'

  #surpise me button show page route
  get '/recommendation/surprise_me', to: "recommendations#surprise_me"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index, :show] do
    resources :recommendations, except: [:index, :show]
  end

  resources :recommendations, only: [:index, :show] do
    resources :datenights, except: [:index, :show]
  end

  resources :datenights, only: [:show]
end
