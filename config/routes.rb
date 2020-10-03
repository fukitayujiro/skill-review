Rails.application.routes.draw do
  devise_for :users
  get 'contents/index'
  root to: "contents#index"
  resources :contents do
    resources :messages
    member do
      get 'search'
    end
  end
end
