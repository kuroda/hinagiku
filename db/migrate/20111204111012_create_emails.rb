class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.belongs_to :user, :null => false
      t.string :address, :null => false
      t.string :verification_token, :null => false
      t.datetime :verified_at

      t.timestamps
    end

    add_index :emails, :address, :unique => true
  end
end
