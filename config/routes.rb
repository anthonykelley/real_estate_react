Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/auth'
  namespace :api do
    resources :properties, only: :index
    get 'cities/:city', to: 'properties#city'
    get 'properties/city_cost', to: 'properties#city_cost'
    resources :agents, only: [:index, :show]
    resources :buyers, only: :show
  end

  #Do not place any routes below this one
  get '*other', to: 'static#index'
end
