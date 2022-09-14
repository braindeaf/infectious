# frozen_string_literal: true
module Infectious
  module Facebook
    module Methods
      def authorize_url(callback_url)
        AychTTP.uri_for(
          protocol: 'https', host: 'www.facebook.com',
          path: '/v2.8/dialog/oauth', app_id: settings['app_id'],
          scope: 'manage_pages,publish_pages,publish_actions',
          redirect_uri: callback_url, response_type: 'code'
        )
      end

      def verify!(callback_url, params)
        uri = AychTTP.uri_for(protocol: 'https', host: 'graph.facebook.com', path: '/v2.8/oauth/access_token')
        json = AychTTP.get(uri, client_params.merge(redirect_uri: callback_url, code: params[:code]))
        Infectious::Authorization.create(provider: 'facebook', data: json.parsed_body,
                                         access_token: json.parsed_body['access_token'])
      end

      # def subscribe(callback_url, verify_token)
      #   post('/v1/subscriptions', object: 'user', aspect: 'media', verify_token: verify_token, callback_url: callback_url)
      # end

      def settings
        @settings ||= YAML.load_file Rails.root.join('config', 'settings', 'facebook.yml')
      end

      private

      def post(path, params = {})
        AychTTP.post(path, client_params.merge(params))
      end

      def client_params
        {
          client_id: settings['app_id'],
          client_secret: settings['app_secret']
        }
      end
    end
    extend Methods

    class API

      attr_accessor :authorization

      def initialize(authorization)
        @authorization = authorization
      end

      def get(path, query = {})
        AychTTP.get("https://api.instagram.com/v1/#{path}", query.merge(access_token: authorization.access_token))
      end
    end
  end
end
