Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users

  # Onboarding routes

  get '/date_frequency', to: "pages#date_frequency"
  get '/edit_preferences', to: "pages#my_preferences"
  post '/edit_preferences', to: "pages#add_preferences"
  get '/update_preferences', to: "pages#edit_preferences"
  post '/update_preferences', to: "pages#update_preferences"
  get '/edit_date_info', to: "pages#my_date_info"


  # route to pick a category (not surprise us)
  get '/pick_a_category', to: "pages#pick_a_category"

  # Profile routes
  get 'profiles/couple_profile'

  #surpise me button show page route
  get '/recommendation/surprise_me', to: "recommendations#surprise_me"

  #pick a category
  get '/recommendation/filtered_index', to: "recommendations#filtered_index"

    #get other choices for surprise me
  get '/recommendation/preference_index', to: "recommendations#preference_index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index, :show] do
    resources :recommendations, except: [:index, :show]
  end

  resources :recommendations, only: [:index, :show] do
    resources :datenights, except: [:index, :show]
  end

  resources :datenights, only: [:show]
end
