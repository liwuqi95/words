Rails.application.routes.draw do



  resources :learning_records
  get 'study/center'
  get 'study/learn/:id', to: 'study#learn', as: 'study_learn'


  get '/study/c_word', to: 'study#c_word', as: 'study_c_word'





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
