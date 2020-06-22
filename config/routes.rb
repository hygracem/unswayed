Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :articles, only: [ :index ]
    end
  end

  get "/dashboard", to: "pages#dashboard"

  resources :articles, { only: [:index, :show, :create,  :destroy] }
  resources :reporters, { only: [:index, :show, :create, :destroy, :update] }

end
