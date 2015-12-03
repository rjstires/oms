Rails.application.routes.draw do
  resources :event_slots
  resources :events
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
    resources :events do
      resources :event_slots
    end

    resources :order_lines, :path => :sales do
      member do
        get 'complete'
      end
    end
  end

  namespace :admin do
    get 'dashboard', to: 'dashboard#index', as: '/'

    resources :armor_types
    resources :categories
    resources :classifications
    resources :characters
    resources :customers
    resources :difficulties
    resources :events do
      resources :event_slots
    end
    resources :factions
    resources :loot_options
    resources :memberships
    resources :mounts
    resources :order_line_statuses
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

    resources :order_lines do
      member do
        get 'complete'
        get 'send_confirmation'
      end
    end
  end

end
