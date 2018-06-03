Rails.application.routes.draw do
  resources :test_records
  devise_for :users
  get 'home/index'

  root to: 'home#index'

  resources :tests
  get '/tests/launch/:id', to: 'tests#launch', as: 'launch_test'


  resources :libraries
  resources :words
  resources :word_libraries


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
