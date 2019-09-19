Rails.application.routes.draw do
  resources :resources
  resources :information
  resources :compounds
  resources :notations
  get '/searchByNotationCode', to: 'notations#findByNotationCode', as: 'findByNotationCode'
  resources :diagrams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
