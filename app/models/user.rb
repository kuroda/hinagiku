require "bcrypt"

class User < ActiveRecord::Base
  has_many :tasks, :foreign_key => "owner_id", :dependent => :destroy
  has_many :categories, :foreign_key => "owner_id", :dependent => :destroy
  has_many :emails, :dependent => :destroy

  attr_accessor :password, :current_password, :new_password
  attr_writer :setting_password, :changing_password
  def setting_password?; @setting_password; end
  def changing_password?; @changing_password; end
  def verified?; verified_at.present?; end
  attr_accessible :login_name, :display_name,
    :password, :password_confirmation,
    :current_password, :new_password, :new_password_confirmation,
    :emails_attributes

  accepts_nested_attributes_for :emails

  validates :login_name, :presence => true, :length => { :maximum => 20 },
    :uniqueness => { :case_sensitive => false }
  validates :display_name, :presence => true, :length => { :maximum => 20 }
  validates :password, :presence => { :if => :setting_password? }
  validates :current_password, :new_password,
    :presence => { :if => :changing_password? }
  validates :password, :new_password,
    :length => { :minimum => 4, :allow_blank => true },
    :confirmation => true

  validate do
    if changing_password?
      unless authenticate(current_password)
        errors.add(:current_password, :invalid)
      end
    end
  end

  before_save do
    if changing_password?
      self.password_digest = BCrypt::Password.create(new_password)
    elsif setting_password?
      self.password_digest = BCrypt::Password.create(password)
    end
  end

  before_create do
    self.auto_login_token = SecureRandom.hex
  end

  def authenticate(unencrypted_password)
    password_digest &&
      BCrypt::Password.new(password_digest) == unencrypted_password
  end
end
