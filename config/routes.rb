Rails.application.routes.draw do
  resources :customer_contacts
  root 'landings#index'
  get 'dashboard', :to => 'pages#index'


  #get 'memberships/index'

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

    resources :order_lines, :path => :sales, :as => 'sales', :only => [:index]
  end

  namespace :admin do
    root to: "dashboard#index"
    get 'leads', controller: :dashboard, action: :leads
    get 'pending-scheduling', controller: :dashboard, action: :pending_scheduling
    get 'scheduled', controller: :dashboard, action: :scheduled

    resources :armor_types
    resources :categories
    resources :classifications
    resources :characters
    resources :customers do
      resources :customer_contacts, as: 'contacts', path: 'contacts', :only => [:new, :create, :edit, :update, :destroy]
    end
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
    resources :products do
      collection do
        get 'search'
      end
    end
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
