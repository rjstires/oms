Rails.application.routes.draw do

  root to: 'visitors#index'

  post 'customers/upload', to: 'customers#upload'
  post 'order_lines/upload', to: 'order_lines#upload'
  post 'teams/upload', to: 'teams#upload'
  post 'users/upload', to: 'users#upload'

  resources :armor_types, controller: 'options', type: 'ArmorType'
  resources :categories, controller: 'options', type: 'Category'
  resources :classifications, controller: 'options', type: 'Classification'
  resources :characters
  resources :customers
  resources :difficulties, controller: 'options', type: 'Difficulty'
  resources :events
  resources :factions, controller: 'options', type: 'Faction'
  resources :leads
  resources :loot_options, controller: 'options', type: 'LootOption'
  resources :memberships
  resources :mounts, controller: 'options', type: 'Mount'
  resources :order_line_statuses, controller: 'options', type: 'OrderLineStatus'
  resources :payment_statuses, controller: 'options', type: 'PaymentStatus'
  resources :payment_types, controller: 'options', type: 'PaymentType'
  resources :play_styles, controller: 'options', type: 'PlayStyle'
  resources :primary_stats, controller: 'options', type: 'PrimaryStat'
  resources :products
  resources :regions, controller: 'options', type: 'Region'
  resources :teams do
    resources :order_lines, :path => :sales do
      get 'complete', to: 'order_lines#complete'
    end
    resources :memberships
  end
  devise_for :users
  resources :users
  resources :tier_tokens, controller: 'options', type: 'TierToken'
  resources :team_statuses, controller: 'options', type: 'TeamStatus'
  resources :zones, controller: 'options', type: 'Zone'
  
  get 'uploads', to: 'pages#uploads'
end
