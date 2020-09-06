class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :description
      t.string :features

      t.timestamps
    end
  end
end
