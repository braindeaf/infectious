# frozen_string_literal: true
module Infectious
  module Spotify
    module Methods
      def authorize_url(callback_url)
        AychTTP.uri_for(
          protocol: 'https', host: 'accounts.spotify.com',
          path: '/en/authorize', client_id: settings['client_id'],
          redirect_uri: callback_url, response_type: 'code'
        )
      end

      def settings
        @settings ||= YAML.load_file Rails.root.join('config', 'settings', 'spotify.yml')
      end
    end
    extend Methods
  end
end
