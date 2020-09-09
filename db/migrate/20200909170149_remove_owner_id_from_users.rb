class RemoveOwnerIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :owner_id, :integer
  end
end
