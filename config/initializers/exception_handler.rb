ActiveSupport::Notifications.subscribe 'process_action.action_controller' do |name, start, finish, id, payload|

  if payload[:exception]
    name, message = *payload[:exception]
    Logs::Error.create!(content: message)
  end

end

ActiveSupport::Notifications.subscribe('render') do |*args|

  Logs::Error.create!(content: "DURATION: #{args}")

end
