# -*- encoding : utf-8 -*-
Damedia::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # root :to => 'high_voltage/pages#show', :id => 'welcome'

  resources :users
  
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
end
