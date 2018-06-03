Rails.application.routes.draw do
  get 'home/index'

  root 'home/index'

  resources :tests
  resources :libraries
  resources :words
  resources :word_libraries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
