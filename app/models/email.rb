class Email < ActiveRecord::Base
  belongs_to :user

  attr_accessible :address

  validates :address, :presence => true, :uniqueness => { :case_sensitive => false }

  before_save do
    if address_changed?
      self.verification_token = SecureRandom.hex
    end
  end

  after_save do
    if verified_at && !user.verified_at
      user.update_attribute(:verified_at, verified_at)
    end
  end
end
