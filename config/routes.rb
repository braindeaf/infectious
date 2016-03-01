Infectious::Engine.routes.draw do
  %w(spotify).each do |type|
    get "/#{type}" => 'authorizations#new', defaults: { type: type }
    get "/#{type}/callback" => 'authorizations#callback', defaults: { type: type }
  end
end
