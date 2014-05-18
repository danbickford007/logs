class CreateLogsRequestData < ActiveRecord::Migration
  def change
    create_table :logs_request_data do |t|
      t.string :method
      t.string :port
      t.string :host
      t.string :user_agent

      t.timestamps
    end
  end
end
