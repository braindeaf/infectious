module Infectious
  class AuthorizationsController < Infectious::ApplicationController
    def new
      redirect_to "https://accounts.spotify.com/en/authorize?client_id=0f8a80290bf14a2d9d8371892916a677&redirect_uri=http:%2F%2Frobl.me%2Fspotify%2Fcallback&response_type=code"
    end

    def callback
      render text: params.to_yaml
    end

    private

    def service_module
      params[:type].camelize
    end
  end
end
