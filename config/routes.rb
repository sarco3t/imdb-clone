Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :movies
    resources :categories
  end

  root to: 'movies#index'
  get '/:id', to: 'movies#show', as: :movie
  post '/movies/:id/rating', to: 'movies#rating', as: :movie_rating
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
