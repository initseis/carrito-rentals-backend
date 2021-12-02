Rails.application.routes.draw do
  namespace :v1 do
    get 'cars/index'
    get 'cars/show'
    get 'cars/new'
    get 'cars/create'
  end
  namespace :v1, defaults: { format: 'json' } do
    resources :user
    resources :cars
    resources :rentals
  end
end
