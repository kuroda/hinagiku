class AddVerifiedAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :verified_at, :datetime
  end
end
