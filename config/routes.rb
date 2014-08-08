Piknpan::Application.routes.draw do

  resources :recipes do
    get :autocomplete_ingredient_name, on: :collection
  end

  resources :item_in_pantries do
    get  :autocomplete_ingredient_name, on: :collection
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users
  resources :users, only: [:show, :index, :update]

  match 'about', to: 'welcome#about', via: :get

  root 'welcome#index'

end
