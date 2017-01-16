Infectious::Engine.routes.draw do
  get '/authorizations' => 'authorizations#index'
  %w(spotify facebook instagram).each do |type|
    get "/#{type}" => 'authorizations#new', defaults: { type: type }
    get "/#{type}/callback" => 'authorizations#callback', defaults: { type: type }
    get "/#{type}/subscriptions/callback", 'subscriptions#callback', defaults: { type: type }
  end
end
