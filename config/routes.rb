Rails.application.routes.draw do
  resources :articles
  namespace :admin do
    resources :users
    root to: "users#index"
  end
  get 'products/:id', to: 'products#show', :as => :products
  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    post 'pay', to: 'registrations#pay'
  end
  resources :users
  root :to => 'visitors#index'
  root to: "home#index"
end
