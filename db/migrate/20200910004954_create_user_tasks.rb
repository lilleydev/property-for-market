class CreateUserTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tasks do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :task, null: false, foreign_key: true
    end
  end
end
