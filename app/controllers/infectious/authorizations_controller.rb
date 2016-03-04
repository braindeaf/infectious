module Infectious
  class AuthorizationsController < Infectious::ApplicationController
    def new
      redirect_to "https://accounts.spotify.com/en/authorize?client_id=0f8a80290bf14a2d9d8371892916a677&redirect_uri=#{callback_url}&response_type=code"
    end

    def callback
      body = JSON.parse(Faraday.new(url: 'https://accounts.spotify.com').post('/api/token', code: params[:code], redirect_uri: callback_url, grant_type: 'authorization_code').body)
      render text: body.to_yaml
    end

    private

    def callback_url
      callback_spotify_url
    end

    def service_module
      params[:type].camelize
    end
  end
end
