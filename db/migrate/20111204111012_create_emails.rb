class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.belongs_to :user, :null => true
      t.string :address
      t.string :lower_case_address
      t.string :verification_token
      t.datetime :verified_at

      t.timestamps
    end
    
    add_index :emails, :lower_case_address, :unique => true
  end
end
