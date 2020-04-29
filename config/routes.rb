Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "/dashboard", to: "pages#dashboard"

  resources :articles, { only: [:index, :show, :create,  :destroy] }
  resources :reporters, { only: [:index, :show, :create, :destroy, :update] }

end
