module Logs
  class Error < ActiveRecord::Base
    has_one :request_data
  end
end
