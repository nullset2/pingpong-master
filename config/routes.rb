Rails.application.routes.draw do
  resources :logged_games
  devise_for :users
  root to: "home#index"
  get '/history', to: 'logged_games#index'
  get '/log',     to: 'logged_games#new'
end
