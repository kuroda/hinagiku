class AddOwnerIdToTasksEtc < ActiveRecord::Migration
  def change
    add_column :tasks, :owner_id, :integer
    add_column :categories, :owner_id, :integer
    change_column :tasks, :owner_id, :integer, :null => false
    change_column :categories, :owner_id, :integer, :null => false
  end
end
