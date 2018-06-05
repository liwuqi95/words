Rails.application.routes.draw do
  resources :chapter_words

  post '/chapter/:id/add_words', to: 'chapters#add_words', as: 'add_chapter_words'
  resources :chapters
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





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
