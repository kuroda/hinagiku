require 'nkf'

class Category < ActiveRecord::Base
  has_many :tasks, :dependent => :nullify
  
  validates :name, :presence => true, :length => { :maximum => 10 }
  validates :name, :uniqueness => { :case_sensitive => false }
  
  before_validation :normalize_values
  
  private
  
  IDEOGRAPHIC_SPACE = [ 0x3000 ].pack("U")
  WHITESPACES = "[\s#{IDEOGRAPHIC_SPACE}]"
  
  def normalize_values
    if name.present?
      self.name = NKF.nkf("-WwZ", name)
      self.name = name.sub(/^#{WHITESPACES}+/, "")
      self.name = name.sub(/#{WHITESPACES}+$/, "")
    end
  end
end
