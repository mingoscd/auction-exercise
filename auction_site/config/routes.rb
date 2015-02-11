Rails.application.routes.draw do
  get '/' => 'site#index', as: 'root'
  resources :users
  resources :items do
    resources :bids
  end
end
