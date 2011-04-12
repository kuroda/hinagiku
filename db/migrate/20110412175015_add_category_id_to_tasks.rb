class AddCategoryIdToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :category_id, :integer
  end

  def self.down
    remove_column :tasks, :category_id
  end
end
