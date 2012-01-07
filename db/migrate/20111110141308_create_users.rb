class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login_name, :null => false
      t.string :display_name, :null => false
      t.string :password_digest, :null => false
      t.string :auto_login_token

      t.timestamps
    end

    add_index :users, :login_name, :unique => true
  end
end
