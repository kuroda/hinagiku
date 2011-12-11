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
  
  before_create do
    self.verification_token = SecureRandom.hex(32)
  end
  
  after_save do
    if verified_at_changed?
      if verified_at
        unless user.verified_at
          user.update_attribute(:verified_at, verified_at)
        end
      else
        unless user.has_verified_email?
          user.update_attribute(:verified_at, nil)
        end
      end
    end
  end
end
