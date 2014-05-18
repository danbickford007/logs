module Logs
  module ApplicationHelper

    def active controller
      controller.to_s == params[:controller] ? 'active' : ''
    end

  end
end
