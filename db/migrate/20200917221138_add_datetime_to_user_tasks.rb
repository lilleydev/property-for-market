class AddDatetimeToUserTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :user_tasks, :created_at, :datetime
  end
end
