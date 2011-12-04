class Email < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :address
end
