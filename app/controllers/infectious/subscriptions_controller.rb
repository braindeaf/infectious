module Infectious
  class SubscriptionsController < ApplicationController
    def callback
      if params['hub.challenge']
        render plain: params['hub.challenge'], status: 200
      else
        render plain: '', status: 400
      end
    end
  end
end