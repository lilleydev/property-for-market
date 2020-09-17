class AddFinshDateToUserTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :user_tasks, :finish_by, :datetime
  end
end
