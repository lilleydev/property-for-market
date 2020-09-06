class CreateRealtors < ActiveRecord::Migration[6.0]
  def change
    create_table :realtors do |t|
      t.belongs_to :owner, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.integer :number
      t.integer :rating

      t.timestamps
    end
  end
end
