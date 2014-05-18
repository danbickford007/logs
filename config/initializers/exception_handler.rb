ActiveSupport::Notifications.subscribe 'process_action.action_controller' do |name, start, finish, id, payload|

  if payload[:exception]
    name, message = *payload[:exception]
    Logs::Error.create!(content: message)
  end

end

taken = []
ActiveSupport::Notifications.subscribe 'action_dispatch.request' do |name, start, finish, id, payload|
    begin
      Rails.logger.debug payload[:request].methods
      if !taken.include? "#{name}-#{start}-#{id}"
        Logs::RequestData.create(host: payload[:request].host_with_port, method: payload[:request].method, 
                                 port: payload[:request].server_port, user_agent: payload[:request].user_agent)  
        taken << "#{name}-#{start}-#{id}"
      end
      if taken.count > 100
        taken = []
      end
    rescue => e
      Rails.logger.debug e
    ensure
      ActiveRecord::Base.clear_active_connections!
    end
end
