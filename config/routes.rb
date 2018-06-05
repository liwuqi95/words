Rails.application.routes.draw do
  resources :word_meanings
  resources :test_records
  devise_for :users
  get 'home/index'

  root to: 'home#index'


  get '/tests/launch/:id', to: 'tests#launch', as: 'launch_test'
  resources :tests


  get '/libraries/list', to: 'libraries#list', as: 'list_libraries'
  resources :libraries


  get '/words/list', to: 'words#list', as: 'list_words'
  resources :words



  resources :word_libraries


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
