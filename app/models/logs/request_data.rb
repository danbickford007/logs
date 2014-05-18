module Logs
  class RequestData < ActiveRecord::Base
    belongs_to :error
  end
end
