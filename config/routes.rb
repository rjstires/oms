Rails.application.routes.draw do
  resources :customers
  
  resources :products
  resources :characters
  root to: 'visitors#index'
    
  resources :events
  resources :memberships
  
  resources :teams do
    resources :order_lines, :path => :sales do
      get 'complete', to: 'order_lines#complete'
    end
    resources :memberships
  end
  
  resources :leads
  
  devise_for :users
  resources :users
  
  resources :armor_types, controller: 'options', type: 'ArmorType'
  resources :categories, controller: 'options', type: 'Category'
  resources :classifications, controller: 'options', type: 'Classification'
  resources :difficulties, controller: 'options', type: 'Difficulty'
  resources :factions, controller: 'options', type: 'Faction'
  resources :loot_options, controller: 'options', type: 'LootOption'
  resources :mounts, controller: 'options', type: 'Mount'
  resources :order_line_statuses, controller: 'options', type: 'OrderLineStatus'
  resources :payment_statuses, controller: 'options', type: 'PaymentStatus'
  resources :payment_types, controller: 'options', type: 'PaymentType'
  resources :play_styles, controller: 'options', type: 'PlayStyle'
  resources :primary_stats, controller: 'options', type: 'PrimaryStat'
  resources :regions, controller: 'options', type: 'Region'
  resources :tier_tokens, controller: 'options', type: 'TierToken'
  resources :team_statuses, controller: 'options', type: 'TeamStatus'
  resources :zones, controller: 'options', type: 'Zone'
  
end
