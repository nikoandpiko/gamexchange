Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'offers#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :offers, except: [ :edit ] do
    resources :rentals, except: [ :edit, :delete ]
  end

  resources :reviews
  resources :users
end
