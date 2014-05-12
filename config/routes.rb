Rails.application.routes.draw do
  
  match 'about', to: 'welcome#about', via: :get
  root 'welcome#index'

end
