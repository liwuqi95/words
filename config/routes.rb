Rails.application.routes.draw do

  resources :quiz_records
  resources :quizzes
  get 'test_records/destory_all', to: 'test_records#destroy_all'
  resources :test_records
  get 'learning_records/destory_all', to: 'learning_records#destroy_all'
  resources :learning_records
  get 'study/center'
  get 'study/quiz/:id', to: 'study#quiz', as: 'study_quiz'
  get 'study/test/:id', to: 'study#test', as: 'study_test'
  get 'study/learn/:id', to: 'study#learn', as: 'study_learn'





  resources :chapter_words

  post '/chapter/:id/add_words', to: 'chapters#add_words', as: 'add_chapter_words'
  get '/chapter/learn/:id', to: 'chapters#learn', as: 'chapter_learn'
  resources :chapters
  resources :word_meanings
  devise_for :users
  get 'home/index'

  root to: 'home#index'



  get '/libraries/list', to: 'libraries#list', as: 'list_libraries'
  resources :libraries


  get '/words/list', to: 'words#list', as: 'list_words'
  resources :words





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
