Rails.application.routes.draw do



  get 'study/center'

  get '/lesson_center', to: 'lesson_records#user', as: 'lesson_center'
  resources :lesson_records



  #to register lesson with user
  resources :lessons
  resources :chapter_words



  post '/chapter/:id/add_words', to: 'chapters#add_words', as: 'add_chapter_words'
  get '/chapter/learn/:id', to: 'chapters#learn', as: 'chapter_learn'
  resources :chapters
  resources :word_meanings
  devise_for :users
  get 'home/index'

  root to: 'home#index'


  get '/tests/launch/:id', to: 'tests#launch', as: 'launch_test'


  get '/libraries/list', to: 'libraries#list', as: 'list_libraries'
  resources :libraries


  get '/words/list', to: 'words#list', as: 'list_words'
  resources :words





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
