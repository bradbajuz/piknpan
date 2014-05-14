Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  match 'about', to: 'welcome#about', via: :get
  root 'welcome#index'

end
