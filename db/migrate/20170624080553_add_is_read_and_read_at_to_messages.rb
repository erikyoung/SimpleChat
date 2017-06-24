class AddIsReadAndReadAtToMessages < ActiveRecord::Migration[5.0]
  def change
  	 add_column :messages, :is_read, :boolean
    add_column :messages, :read_at, :timestamp
  end
end
