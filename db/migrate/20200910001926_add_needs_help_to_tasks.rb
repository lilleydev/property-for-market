class AddNeedsHelpToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :needs_help, :boolean
  end
end
