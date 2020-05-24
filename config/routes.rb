Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations"}
  resources :users, only: [ :new, :create, :show ]
  resources :events

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#new'
end
