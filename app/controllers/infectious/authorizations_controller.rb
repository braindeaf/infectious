module Infectious
  class AuthorizationsController < Infectious::ApplicationController
    def new
      redirect_to uri_for(
        protocol: 'https', host: 'accounts.spotify.com', path: '/en/authorize', client_id: settings['client_id'], redirect_uri: callback_url, response_type: 'code'
      )
    end

    def callback
      json = AychTTP.post('https://accounts.spotify.com/api/token', code: params[:code], client_id: settings['client_id'], client_secret: settings['client_secret'], redirect_uri: callback_url, grant_type: 'authorization_code')
      Infectious::Authorization.create(provider: 'spotify', data: json.parsed_body, access_token: json.parsed_body['access_token'])
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

    def uri_for(args)
      host, port, path = [args.delete(:host), args.delete(:port), args.delete(:path)]
      builder = args.delete(:protocol) == 'https' ? URI::HTTPS : URI::HTTP

      if host.nil?
        host =   Site.config.host
        port ||= Site.config.port
      end

      uri = builder.build host: host, port: port, path: path
      unless args.empty?
        uri.query = args.reject { |_k, v| v.nil? }.sort_by { |k, _v| k.to_s }.map { |k, v| "#{k}=#{v.to_s}" }.join('&')
      end
      uri.to_s
    end
  end
end
