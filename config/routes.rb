Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users

  get '/edit_preferences', to: "pages#my_preferences"
  get '/edit_dateinfo', to: "pages#my_dateinfo"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index, :show] do
    resources :recommendations
  end

  resources :recommendations, only: [:index, :show] do
    resources :datenights, only: [:create, :new, :edit, :update, :destroy]
  end

  resources :datenights, only: [:show]

end
