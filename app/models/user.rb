class User < ActiveRecord::Base
  has_secure_password
  
  has_many :tasks, :foreign_key => 'owner_id', :dependent => :destroy
  has_many :categories, :foreign_key => 'owner_id', :dependent => :destroy
  
  attr_accessible :login_name, :email, :password
  
  validates :login_name, :presence => true, :length => { :maximum => 20 }, :uniqueness => true
  
  before_validation do
    self.lower_case_email = email.downcase if email.present?
  end
  
  validate do
    users = User.where(:lower_case_email)
    users = users.where([ "id <> ?", id]) if id
    if users.present?
      errors.add(:email, :taken)
    end
  end
  
  before_create do
    self.auto_login_token = SecureRandom.hex(32)
  end
end
