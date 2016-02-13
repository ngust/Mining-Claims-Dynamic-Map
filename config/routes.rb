Rails.application.routes.draw do

  root 'claims#index'

  resources :claims
end
