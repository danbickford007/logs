ActiveSupport::Notifications.subscribe 'process_action.action_controller' do |name, start, finish, id, payload|

  if payload[:exception]
    name, message = *payload[:exception]
    Logs::Error.create!(content: message)
  end

end
count = 0
ActiveSupport::Notifications.subscribe 'action_dispatch.request' do |name, start, finish, id, payload|
    count += 1
    Rails.logger.debug count 
    if count % 9 == 0
      Rails.logger.debug payload[:request].methods
      Logs::RequestData.create(host: payload[:request].host_with_port, method: payload[:request].method, 
                               port: payload[:request].server_port, user_agent: payload[:request].user_agent)  
    end
end
