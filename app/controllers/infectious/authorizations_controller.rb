module Infectious
  class AuthorizationsController < Infectious::ApplicationController
    def index
      @authorizations = Infectious::Authorization.all
    end

    def new
      redirect_to service_module.authorize_url(callback_url)
    end

    def callback
      service_module.verify!(callback_url, params)
      redirect_to action: :index
    end

    private

    def callback_url
      send [params[:type], :callback_url].join('_')
    end

    def service_module
      "Infectious::#{params[:type].camelize}".constantize
    end
  end
end
