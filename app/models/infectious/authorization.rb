# frozen_string_literal: true
module Infectious
  class Authorization < ApplicationRecord
    serialize :data, Hash

    def media
      api.get('/me/media?fields=id,media_type,media_url,caption,permalink,timestamp')
    end

    def user
      api.get('/me?fields=id,username,media_count')
    end

    def refresh!
      h = api.get("/access_token?grant_type=ig_exchange_token&client_secret=#{Instagram.settings['client_secret']}&access_token=#{access_token}")
      if h['access_token']
        update(access_token: h['access_token'], expires_at: h['expires_in'].seconds.from_now)
      end
    end

    private

    def api
      @api ||= ::Instagram.api(access_token)
    end
  end
end
