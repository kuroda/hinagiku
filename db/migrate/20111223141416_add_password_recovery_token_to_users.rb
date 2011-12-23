class AddPasswordRecoveryTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_recovery_token, :string
  end
end
