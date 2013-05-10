require 'sidekiq/web'

Subscribers::Application.routes.draw do

  root to: 'lists#index'

  resources :lists do
    member do
      get 'import'
      post 'import'
    end
    resources :subscribers
  end

  resources :campaigns do
    member do
      get 'preview'
      get 'deliveries'
      post 'schedule'
      get 'schedule'
    end
  end

  get 'login', to: 'admin_sessions#new', as: 'login'
  get 'logout', to: 'admin_sessions#destroy', as: 'logout'
  resources :admin_sessions

  get 'open/:token' => 'deliveries#open'
  get 'click/:token' => 'deliveries#click'
  get 'unsubscribe/:token' => 'deliveries#unsubscribe'

  # mount Sidekiq::Web, at: "/sidekiq"
end
