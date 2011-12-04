class User < ActiveRecord::Base
  has_secure_password
  
  has_many :tasks, :foreign_key => 'owner_id', :dependent => :destroy
  has_many :categories, :foreign_key => 'owner_id', :dependent => :destroy
  has_many :emails, :dependent => :destroy
  
  attr_accessible :login_name, :password, :emails_attributes
  
  accepts_nested_attributes_for :emails
  
  validates :login_name, :presence => true, :length => { :maximum => 20 }, :uniqueness => true
  
  before_create do
    self.auto_login_token = SecureRandom.hex(32)
  end
end
