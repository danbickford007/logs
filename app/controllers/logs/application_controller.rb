module Logs
  class ApplicationController < ActionController::Base

    before_filter :auth

    def auth
      authenticate_or_request_with_http_basic do |username, password|
        username == 'test' && password == '1234'
      end
    end

  end
end
