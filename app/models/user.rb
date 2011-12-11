require 'bcrypt'

class User < ActiveRecord::Base
  has_many :tasks, :foreign_key => 'owner_id', :dependent => :destroy
  has_many :categories, :foreign_key => 'owner_id', :dependent => :destroy
  has_many :emails, :dependent => :destroy
  
  attr_accessor :password
  attr_accessible :login_name, :password
  
  validates :login_name, :presence => true, :length => { :maximum => 20 },
    :uniqueness => true
  validates :password,
    :length => { :minimum => 4, :allow_nil=> true },
    :confirmation => true
  
  before_create do
    self.auto_login_token = SecureRandom.hex(32)
  end
  
  before_save do
    self.password_digest = BCrypt::Password.create(password) if password
  end
  
  def authenticate(unencrypted_password)
    password_digest &&
      BCrypt::Password.new(password_digest) == unencrypted_password
  end
end
