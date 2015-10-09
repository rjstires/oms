Rails.application.routes.draw do
  get 'memberships/index'

  root 'landings#index'

  get 'dashboard', :to => 'pages#index'
  get 'admin/dashboard', :to => 'admin/dashboard#index'


  devise_for :users, :controllers => { :registrations => "user/registrations" }
  resources :users

  resources :memberships do
    patch 'approve', to: 'memberships#approve'
    patch 'remove', to: 'memberships#remove'
  end

  resources :teams do
    resources :order_lines, :path => :sales do
      get 'complete', to: 'order_lines#complete'
    end
  end

  namespace :admin do
    get 'dashboard', to: 'dashboard#index', as: '/'

    get 'uploads', to: 'pages#uploads'
    post 'customers/upload', to: 'customers#upload'
    post 'order_lines/upload', to: 'order_lines#upload'
    post 'teams/upload', to: 'teams#upload'
    post 'users/upload', to: 'users#upload'

    resources :armor_types
    resources :categories
    resources :classifications
    resources :characters
    resources :customers
    resources :difficulties
    resources :factions
    resources :loot_options
    resources :memberships
    resources :mounts
    resources :order_line_statuses
    resources :order_lines do
      get 'send_confirmation', to: 'order_lines#send_confirmation'
    end
    resources :events do
      resources :slots
    end
    resources :payment_statuses
    resources :payment_types
    resources :play_styles
    resources :primary_stats
    resources :products
    resources :regions
    resources :team_statuses
    resources :teams
    resources :tier_tokens
    resources :users
    resources :zones
  end
end
