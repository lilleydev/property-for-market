class RemoveOwnerIdFromRealtors < ActiveRecord::Migration[6.0]
  def change
    remove_column :realtors, :owner_id, :integer
  end
end
