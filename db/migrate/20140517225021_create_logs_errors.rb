class CreateLogsErrors < ActiveRecord::Migration
  def change
    create_table :logs_errors do |t|
      t.text :content

      t.timestamps
    end
  end
end
