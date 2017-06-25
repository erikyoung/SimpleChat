class CreateFrienships < ActiveRecord::Migration[5.0]
  def change
    create_table :frienships do |t|

      t.timestamps
    end
  end
end
