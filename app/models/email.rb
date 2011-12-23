class Email < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :address
  
  before_validation do
    self.lower_case_address = address.downcase if address.present?
  end
  
  validates :address, :presence => true
  validate do
    emails = Email.where(:lower_case_address)
    emails = emails.where([ "id <> ?", id ]) if id
    if emails.present?
      errors.add(:address, :taken)
    end
  end
  
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
