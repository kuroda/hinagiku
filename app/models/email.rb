class Email < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :address
  
  before_validation do
    self.lower_case_address = address.downcase if address.present?
  end
  
  validates :address, :presence => true
  validates :lower_case_address, :uniqueness => true
end
