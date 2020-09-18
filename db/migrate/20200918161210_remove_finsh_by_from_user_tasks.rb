class RemoveFinshByFromUserTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_tasks, :finish_by, :datetime
  end
end
