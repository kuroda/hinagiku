require 'bcrypt'

class User < ActiveRecord::Base
  has_many :tasks, :foreign_key => 'owner_id', :dependent => :destroy
  has_many :categories, :foreign_key => 'owner_id', :dependent => :destroy
  has_many :emails, :dependent => :destroy
  
  attr_accessor :password
  attr_accessible :login_name, :password, :emails_attributes

  accepts_nested_attributes_for :emails

  validates :login_name, :presence => true, :length => { :maximum => 20 },
    :uniqueness => true
  validates :password,
    :length => { :minimum => 4, :allow_nil=> true },
    :confirmation => true
  
  before_save do
    self.password_digest = BCrypt::Password.create(password) if password
  end
  
  before_create do
    self.auto_login_token = SecureRandom.hex
  end
  
  def authenticate(unencrypted_password)
    password_digest &&
      BCrypt::Password.new(password_digest) == unencrypted_password
  end
  
  def verified?
    !!verified_at
  end
end
