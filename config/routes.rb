Piknpan::Application.routes.draw do

  resources :recipes, only: [:index, :show, :new, :create, :edit, :destroy]
  resources :item_in_pantries, only: [:index, :show, :new, :create, :edit, :destroy]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  match 'about', to: 'welcome#about', via: :get
  root 'welcome#index'

end
