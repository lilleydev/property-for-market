class DropRealtors < ActiveRecord::Migration[6.0]
  def change
    drop_table :realtors
  end
end
