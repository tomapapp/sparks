Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users

  get '/edit_preferences', to: "pages#my_preferences"
  get '/edit_date_info', to: "pages#my_date_info"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index, :show] do
    resources :recommendations
  end

  resources :recommendations, only: [:index, :show] do
    resources :datenights, only: [:create]
  end

  resources :datenights, only: [:show]

end
