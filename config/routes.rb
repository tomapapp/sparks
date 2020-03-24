Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index, :show] do
    resources :recommendations, except: [:index, :show]
  end

  resources :recommendations, only: [:index, :show] do
    resources :datenights, except: [:index, :show]
  end

  resources :datenights, only: [:index, :show]

end
