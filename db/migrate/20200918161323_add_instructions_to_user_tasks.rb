class AddInstructionsToUserTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :user_tasks, :instructions, :string
  end
end
