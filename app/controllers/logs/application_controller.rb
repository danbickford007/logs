module Logs
  class ApplicationController < ActionController::Base
    
    before_filter :load_yml
    before_filter :auth

    def load_yml
      if File.file?("#{Rails.root}/config/logs.yml")
        @config ||= YAML.load_file("#{Rails.root}/config/logs.yml")[Rails.env]
        @username ||= @config['username']
        @password ||= @config['password']
      end
    end

    def auth
      authenticate_or_request_with_http_basic do |username, password|
        if @username and @password
          username == @username && password == @password
        else
          username == USERNAME && password == PASSWORD
        end
      end
    end

  end
end
