Rails.application.routes.draw do
  namespace :v1, defaults: { format: 'json' } do
    resources :users
    resources :cars
    resources :rentals
    post :signin, to: 'auth#create'
    post :signup, to: 'users#create'
    post :validate, to: 'users#validate'
  end
end
