module Infectious
  class AuthorizationsController < Infectious::ApplicationController
    def new
      redirect_to "https://accounts.spotify.com/en/authorize?client_id=#{settings['client_id']}&redirect_uri=#{callback_url}&response_type=code"
    end

    def callback
      json = AychTTP.post('https://accounts.spotify.com/api/token', code: params[:code], client_id: settings['client_id'], client_secret: settings['client_secret'], redirect_uri: callback_url, grant_type: 'authorization_code')
      Authorization.create(provider: 'spotify', data: json.parsed_body, access_token: json.parsed_body['access_token'])
      render text: json.parsed_body.to_yaml
    end

    private

    def settings
      @settings ||= YAML.load_file Rails.root.join('config', 'settings', 'spotify.yml')
    end

    def callback_url
      send [params[:type], :callback_url].join('_')
    end

    def service_module
      params[:type].camelize
    end
  end
end
