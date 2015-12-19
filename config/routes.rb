Rails.application.routes.draw do
  resources :customer_contacts
  root 'landings#index'
  get 'dashboard', :to => 'pages#index'

  devise_for :users, :controllers => { :registrations => "user/registrations", sessions: 'user/sessions' }
  resources :users

  resources :teams, :except => [:index] do

    member do
      get :dashboard
      get :completed_orders
    end

    resources :events do
      resources :event_slots
    end

    resources :memberships do
      member do
        post :approve
        post :decline
        post :promote
      end
    end
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

    resources :order_lines, except: [:index] do

      collection do
        get :completed
      end

      member do
        get 'complete'
        get 'send_confirmation'
      end
    end
  end

end
