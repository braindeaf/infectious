module Infectious
  class SubscriptionsController < ApplicationController
    def callback
      if params['hub.challenge']
        render text: params['hub.challenge'], status: 200
      else
        render status: 400
      end
    end
  end
end