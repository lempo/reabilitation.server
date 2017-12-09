class AddGroupToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :group, index: true, foreign_key: true
  end
end
