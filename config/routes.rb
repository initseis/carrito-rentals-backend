Rails.application.routes.draw do
  namespace :v1, defaults: { format: 'json' } do
    resources :user
    resources :cars
    resources :rentals
  end
end
