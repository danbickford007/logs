class AddErrorIdToRequestData < ActiveRecord::Migration
  def change
    add_column :logs_request_data, :error_id, :integer
  end
end
