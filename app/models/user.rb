class User < ActiveRecord::Base
  has_secure_password
  
  before_create do
    self.auto_login_token = SecureRandom.hex(32)
  end
end
