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
end
