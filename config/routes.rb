Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  authenticated :user do
    root 'pages#home', as: :authenticated_root
  end

  root 'pages#landing'

  resources :pages, only: [:landing, :home]

  resources :issues, only: [:show, :new, :create, :edit, :update]

  resources :announcements, only: [:new, :create, :edit, :update]

end
