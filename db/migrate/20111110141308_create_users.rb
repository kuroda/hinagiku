class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login_name, :null => false
      t.string :email, :null => false
      t.string :lower_case_email, :null => false
      t.string :password_digest
      t.string :auto_login_token
      t.string :verification_token
      t.datetime :verified_at

      t.timestamps
    end
    
    add_index :users, :login_name, :unique => true
    add_index :users, :lower_case_email, :unique => true
  end
end
