module Infectious
  class AuthorizationsController < Infectious::ApplicationController
    def new
      redirect_to "https://accounts.spotify.com/en/authorize?client_id=0f8a80290bf14a2d9d8371892916a677&redirect_uri=#{callback_url}&response_type=code"
    end

    def callback
      json = AychTTP.post('https://accounts.spotify.com/api/token', code: params[:code], redirect_uri: callback_url, grant_type: 'authorization_code')
      render text: json.to_yaml
    end

    private

    def callback_url
      send [params[:type], :callback_url].join('_')
    end

    def service_module
      params[:type].camelize
    end
  end
end
