# frozen_string_literal: true
Infectious::Engine.routes.draw do
  resources :authorizations, only: :index do
    member do
      get '/refresh', action: :refresh
    end
  end
  %w(spotify facebook twitter instagram).each do |type|
    get "/#{type}" => 'authorizations#new', defaults: { type: type }
    get "/#{type}/callback" => 'authorizations#callback', defaults: { type: type }
    match "/#{type}/subscriptions/callback" => 'subscriptions#callback', defaults: { type: type }, via: [:get, :post]
  end
end
