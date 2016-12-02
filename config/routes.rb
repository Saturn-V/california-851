Rails.application.routes.draw do

  # root 'pages#landing'
  root 'pages#home'

  resources :pages, only: [:landing, :home]

  resources :issues, only: [:show, :new, :create]

  # get 'home', to: 'home#index'
  # get 'home', to: 'issues#index'
  # get 'home', to: 'announcements#index'
  #
  # get 'home/issue/:id', to: 'issues#show', as: 'show_issue'
  # get 'home/issues/new', to: 'issues#new', as: 'issues'
  # get 'home/issues/new', to: 'issues#new', as: 'new_issue'
  # post 'home', to: 'issues#create'

end
