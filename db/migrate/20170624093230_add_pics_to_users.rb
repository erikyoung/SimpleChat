class AddPicsToUsers < ActiveRecord::Migration[5.0]
  def change
  end
  add_column :users, :image_url, :string
end
