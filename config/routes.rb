Rails.application.routes.draw do
  devise_for :users
  get 'contents/index'
  root to: "contents#index"
  resources :contents do
    resources :messages
    menber do
      get 'search'
    end
  end
end
